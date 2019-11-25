#!/bin/bash

set -e

prompt1="Enter your option: "
MOUNTPOINT="/mnt"
ESP="/efi"
LOCALE_UTF8="en_US.UTF-8"

arch_chroot() {
arch-chroot $MOUNTPOINT /bin/bash -c "${1}"
}

contains_element() {
#check if an element exist in a string
for e in "${@:2}"; do [[ $e == "$1" ]] && break; done;
}

#SELECT DEVICE
select_device(){
  devices_list=$(lsblk -d | awk '{print "/dev/" $1}' | grep 'sd\|hd\|vd\|nvme\|mmcblk');
  PS3="$prompt1"
  echo -e "Attached Devices:\n"
  lsblk -lnp -I 2,3,8,9,22,34,56,57,58,65,66,67,68,69,70,71,72,91,128,129,130,131,132,133,134,135,259 | awk '{print $1,$4,$6,$7}'| column -t
  echo -e "\n"
  echo -e "Select device to partition:\n"
  select device in "${devices_list[@]}"; do
    if contains_element "${device}" "${devices_list[@]}"; then
      break
    else
      exit 1
    fi
  done
}

#CREATE_PARTITION
create_partition(){
  # Set GPT scheme
  parted "${device}" mklabel gpt &> /dev/null
  # Create ESP for /efi
  parted "${device}" mkpart primary fat32 1MiB 512MiB &> /dev/null
  parted "${device}" set 1 esp on &> /dev/null
  # Create encrypted swap
  parted "${device}" mkpart primary 512MiB 8GiB &> /dev/null
  # Create /
  parted "${device}" mkpart primary 8GiB 100% &> /dev/null
}

#FORMAT_PARTITION
format_partition(){
  mkfs.fat -F32 "${device}"1 > /dev/null
  
  echo "LUKS Setup for '/' partition"
  cryptsetup luksFormat --type luks1 -s 512 -h sha512 -i 3000 "${device}"3
  echo "LUKS Setup for SWAP partition"
  cryptsetup luksFormat -s 512 -h sha512 -i 3000 "${device}"2
  echo "Open '/' partition"
  cryptsetup open "${device}"3 cryptroot
  
  mkfs.xfs /dev/mapper/cryptroot > /dev/null
}

#MOUNT_PARTITION
mount_partition(){
  mount /dev/mapper/cryptroot ${MOUNTPOINT}
  mkdir ${MOUNTPOINT}${ESP}
  mount "${device}"1 ${MOUNTPOINT}${ESP}
}

#MIRROR_LIST
mirror_list(){
  echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.neusoft.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.cqu.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist
}

#INSTALL_BASE
install_base(){
  pacstrap ${MOUNTPOINT} base xfsprogs linux-hardened linux-firmware intel-ucode man-db man-pages texinfo nano
}

#ESSENTIAL CONFIGURATION
configuration(){
  # Generate fstab
  genfstab -U ${MOUNTPOINT} >> ${MOUNTPOINT}/etc/fstab
  # Setup time
  arch_chroot "ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime"
  arch_chroot "hwclock --systohc"
  # Setup locale
  echo 'LANG='$LOCALE_UTF8'' > ${MOUNTPOINT}/etc/locale.conf
  arch_chroot "sed -i 's/#\('${LOCALE_UTF8}'\)/\1/' /etc/locale.gen"
  arch_chroot "locale-gen"
  # Setup hostname
  read -r -p "Hostname [ex: archlinux]: " host_name
  echo "$host_name" > ${MOUNTPOINT}/etc/hostname
  arch_chroot "sed -i '/127.0.0.1/s/$/ '${host_name}'/' /etc/hosts"
  arch_chroot "sed -i '/::1/s/$/ '${host_name}'/' /etc/hosts"
}

#ADD_KEYFILE
add_keyfile(){
  arch_chroot "dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock > /dev/null"
  arch_chroot "chmod 600 /crypto_keyfile.bin"
  arch_chroot "chmod 600 /boot/initramfs-linux*"
  echo "Add key to swap and root partition"
  echo "Root:"
  cryptsetup luksAddKey "${device}"3 ${MOUNTPOINT}/crypto_keyfile.bin
  echo "Swap:"
  cryptsetup luksAddKey "${device}"2 ${MOUNTPOINT}/crypto_keyfile.bin
}

#MAKESWAP
make_swap(){
  cryptsetup open "${device}"2 swapDevice --key-file ${MOUNTPOINT}/crypto_keyfile.bin
  mkswap /dev/mapper/swapDevice
  echo '/dev/mapper/swapDevice swap swap defaults 0 0' >> ${MOUNTPOINT}/etc/fstab
}

#SETUP_BOOTLOADER_AND_INITRAMFS
setup_bootloader(){
  cryptroot_uuid=$(blkid -o value -s UUID "${device}"3)
  arch_chroot "pacman -S grub efibootmgr --noconfirm"

  # Setup grub config
  sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cryptdevice=UUID='"${cryptroot_uuid}"':cryptroot:allow-discards root=\/dev\/mapper\/cryptroot rw"/' ${MOUNTPOINT}/etc/default/grub
  sed -i '/GRUB_ENABLE_CRYPTODISK=y/s/^#//' ${MOUNTPOINT}/etc/default/grub

  # Setup mkinitcpio.conf
  sed -i 's/FILES=()/FILES=(\/crypto_keyfile.bin)/' ${MOUNTPOINT}/etc/mkinitcpio.conf
  sed -i '/^HOOK/s/([^()]*)/(base udev autodetect keyboard modconf block encrypt openswap filesystems fsck)/' ${MOUNTPOINT}/etc/mkinitcpio.conf
  # Setup swap hooks
  echo "run_hook ()
{
  ## Optional: To avoid race conditions
  x=0;
  while [ ! -b /dev/mapper/cryptroot ] && [ \$x -le 10 ]; do
      x=\$((x+1))
      sleep .2
  done
  ## End of optional

  mkdir crypto_key_device
  mount /dev/mapper/cryptroot crypto_key_device
  cryptsetup open --key-file crypto_key_device/crypto_keyfile.bin ${device}2 swapDevice
  umount crypto_key_device
}" > ${MOUNTPOINT}/etc/initcpio/hooks/openswap

  echo "build ()
{
   add_runscript
}
help ()
{
cat<<HELPEOF
  This opens the swap encrypted partition /dev/${device}2 in /dev/mapper/swapDevice
HELPEOF
}" > ${MOUNTPOINT}/etc/initcpio/install/openswap

  mkdir ${MOUNTPOINT}/etc/pacman.d/hooks/
  echo "[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = linux*

[Action]
Description = Change the permission of the initramfs after kernel installation.
When = PostTransaction
Exec = /bin/sh -c 'chmod 600 /boot/initramfs-linux*'
" > ${MOUNTPOINT}/etc/pacman.d/hooks/99-change-initramfs-permission.hook

  echo "[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = File
Target = boot/vmlinuz-linu*

[Action]
Description = Updating GRUB Config
Depends = grub
When = PostTransaction
Exec = /bin/sh -c 'grub-mkconfig -o /boot/grub/grub.cfg'
" > ${MOUNTPOINT}/etc/pacman.d/hooks/98-update-grub.hook
  
  arch_chroot "mkinitcpio -p linux-hardened"
  arch_chroot "grub-install --target=x86_64-efi --efi-directory=${ESP} --bootloader-id=GRUB --recheck"
  arch_chroot "grub-mkconfig -o /boot/grub/grub.cfg"
}

#SETUP GNOME
setup_gnome(){
  arch_chroot "pacman -S gnome --noconfirm"
  arch_chroot "systemctl enable gdm.service"
}

#CREATE_USER
create_user(){
  arch_chroot "pacman -S zsh sudo --noconfirm" 
  read -r -p "Username: " username
  arch_chroot "useradd -m -G wheel -s /bin/zsh ${username}"
  arch_chroot "sed -i '/%wheel ALL=(ALL) ALL/s/^#//' /etc/sudoers"
  arch_chroot "passwd ${username}"
}

#FINISH
finish() {
  umount -R /mnt
  reboot
}

#INSTALLATION
select_device
create_partition
format_partition
mount_partition
mirror_list
install_base
configuration
add_keyfile
make_swap
setup_bootloader
setup_gnome
create_user
finish

#!/bin/zsh

# Cleanup and create new dirs
echo -n "Cleaning up..."
rm -rf $(pwd)/emacs $(pwd)/i3* $(pwd)/gebaar $(pwd)/hooks $(pwd)/rofi
mkdir -p $(pwd)/emacs $(pwd)/i3/i3wm $(pwd)/gebaar $(pwd)/rofi
echo "Done"

# sync Emacs configs
echo -n "Syncing Emacs configs..."
cp ~/.emacs.d/init.el $(pwd)/emacs
cp -r ~/.emacs.d/lisp $(pwd)/emacs
echo "Done"

# sync i3wm config
echo -n "Syncing i3wm and i3blocks config..."
cp ~/.config/i3/config $(pwd)/i3/i3wm
cp -r ~/.config/i3blocks/ $(pwd)/i3/
echo "Done"

# sync gebaar config
echo -n "Syncing gebaar config..."
cp ~/.config/gebaar/gebaard.toml $(pwd)/gebaar
echo "Done"

# sync Pacman hooks
echo -n "Syncing pacman hooks..."
cp -r /etc/pacman.d/hooks/ $(pwd)/
echo "Done"

# sync rofi scripts
echo -n "Syncing rofi scripts..."
cp -r ~/.local/share/rofi $(pwd)/

# sync package list
echo -n "Syncing package list..."
pacman -Qneq > native-package-list
pacman -Qmeq > aur-package-list
echo "Done"

#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
HOSTNAME=$(< /proc/sys/kernel/hostname tr -d '\n')
echo "Profile name: ${HOSTNAME}"

# Cleanup and create new folders
echo -n "Cleaning up..."
rm -rf "${SCRIPTPATH}"/../emacs "${SCRIPTPATH}"/../hooks "${SCRIPTPATH}"/../package-list
mkdir -p "${SCRIPTPATH}"/../emacs "${SCRIPTPATH}"/../package-list/"${HOSTNAME}"
echo "Done"

# sync Emacs configs
echo -n "Syncing Emacs configs..."
cp ~/.emacs.d/custom*.{el,png} "${SCRIPTPATH}"/../emacs
echo "Done"

# sync Pacman hooks
echo -n "Syncing pacman hooks..."
cp -r /etc/pacman.d/hooks/ "${SCRIPTPATH}"/../
echo "Done"

# sync package list
echo -n "Syncing package list..."
pacman -Qneq > "${SCRIPTPATH}"/../package-list/"${HOSTNAME}"/native-package-list
pacman -Qmeq > "${SCRIPTPATH}"/../package-list/"${HOSTNAME}"/aur-package-list
echo "Done"

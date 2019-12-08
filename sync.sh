#!/bin/zsh

# Cleanup and create new dirs
echo -n "Cleaning up..."
rm -rf $(pwd)/emacs $(pwd)/hooks
mkdir -p $(pwd)/emacs
echo "Done"

# sync Emacs configs
echo -n "Syncing Emacs configs..."
cp ~/.emacs.d/custom*.el $(pwd)/emacs
echo "Done"

# sync Pacman hooks
echo -n "Syncing pacman hooks..."
cp -r /etc/pacman.d/hooks/ $(pwd)/
echo "Done"

# sync package list
echo -n "Syncing package list..."
pacman -Qneq > native-package-list
pacman -Qmeq > aur-package-list
echo "Done"

#!/bin/zsh

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

# sync package list
echo -n "Syncing package list..."
pacman -Qne > native-package-list
pacman -Qme > aur-package-list
echo "Done"

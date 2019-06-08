#!/bin/zsh

# sync Emacs configs
echo -n "Syncing Emacs configs..."
cp ~/.emacs.d/init.el $(pwd)/emacs
cp -r ~/.emacs.d/lisp $(pwd)/emacs
echo "Done"

# sync i3wm config
echo -n "Syncing i3wm config..."
cp ~/.config/i3/config  $(pwd)
echo "Done"

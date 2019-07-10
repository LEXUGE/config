#!/bin/zsh

# sync Emacs configs
echo -n "Syncing Emacs configs..."
cp ~/.emacs.d/init.el $(pwd)/emacs
cp -r ~/.emacs.d/lisp $(pwd)/emacs
echo "Done"

# sync i3wm config
echo -n "Syncing i3wm and i3blocks config..."
cp ~/.config/i3/config $(pwd)/i3/i3wm
cp ~/.config/i3blocks/config $(pwd)/i3/i3blocks
echo "Done"


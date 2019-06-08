#!/bin/zsh

# sync Emacs configs
echo "Syncing Emacs configs..."
cp ~/.emacs.d/init.el $(pwd)/emacs
cp -r ~/.emacs.d/lisp $(pwd)/emacs
echo "Done"

#!/bin/bash

git config --global user.signingkey AE53B4C2E58EDD45
test -r ~/.bash_profile && echo "export GPG_TTY=$(tty)" >> ~/.bash_profile
echo "export GPG_TTY=$(tty)" >> ~/.profile

# sign all commits globally
git config --global commit.gpgsign true

# store the credential
git config --global credential.helper store

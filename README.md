# Config
Harry Ying's configs

# File description
File | Description
--- | ---
`emacs/` | Emacs configs
`config` | i3wm config

# Prerequisites
Assume you are using Arch Linux in which the package manager is `pacman`.  
## emacs
In order to use the spell-check function in English in the `emacs` dotfiles, following steps are required:  
```
$ sudo pacman -S aspell aspell-en
```
(`aspell-en` can be supplanted by `aspell-*` in order to use dictionaries other than English)  
## i3wm
In the `i3wm` dotfile, I use two fonts, `ttf-roboto` and `wqy-microhei`. Therefore, install these packages:  
```
$ sudo pacman -S ttf-roboto wqy-microhei
```
## RLS (Rust Language Server)
If you want to use RLS, you need to add following components in rustup:  
```
rustup component add rls rust-src rust-analysis
```
Then use `cargo build` in your project dictionary for the first time.

# Usage
Simply override your own configs.

# Config
Harry Ying's configs

# File description
File | Description
--- | ---
`emacs/` | Emacs configs
`i3/i3wm/config` | i3wm config
`i3/i3blocks/config` | i3blocks config

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
The config also requires `feh` as wallpaper setter, `light` for backlight control and several packages that are used by `i3blocks`:  
```
$ sudo pacman -S acpi bc lm_sensors playerctl alsa-utils sysstat feh light
```
## RLS (Rust Language Server)
If you want to use RLS, you need to add following components in rustup:  
```
rustup component add rls rust-src rust-analysis
```
Then use `cargo build` in your project root folder for the first time.

# Usage
Simply override your own configs.

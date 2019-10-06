# Config
Harry Ying's configs

# File description
File | Description
--- | ---
`emacs/` | Emacs configs
`i3/i3wm/config` | i3wm config
`i3/i3blocks/` | i3blocks config and scripts
`gebaar/` | Gebaar gesture config
`native-package-list` | All the official packages installed
`aur-package-list` | All the AUR packages installed
`hooks` | All the pacman hook configs

# Prerequisites
Assume you are using Arch Linux in which the package manager is `pacman`.  
## emacs
In order to use the spell-check function in English in the `emacs` dotfiles, following steps are required:  
```
$ sudo pacman -S aspell aspell-en
```
(`aspell-en` can be supplanted by `aspell-*` in order to use dictionaries other than English)  
## i3wm
In the `i3wm` and `i3blocks` dotfiles, I use some fonts. Therefore, install these packages:  
```
$ sudo pacman -S ttf-roboto wqy-microhei ttf-font-awesome
```
The config also requires `rofi` as app launcher, `feh` as wallpaper setter, `gnome-screenshot` as screenshot taker, `light` for backlight control and several packages that are used by `i3blocks`, `xss-lock` as **IMPORTANT** screen lock hooker, `pacman-contrib` for update checker:  
```
$ sudo pacman -S rofi acpi bc lm_sensors playerctl alsa-utils sysstat feh light gnome-screenshot xss-lock pacman-contrib
```
## RLS (Rust Language Server)
If you want to use RLS, you need to add following components in rustup:  
```
rustup component add rls rust-src rust-analysis
```
Then use `cargo build` in your project root folder for the first time.

# Usage
Simply override your own configs.

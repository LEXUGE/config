# Config
Harry Ying's configs

# File description
File | Description
--- | ---
`emacs/` | Emacs configs
`native-package-list` | All the official packages installed
`aur-package-list` | All the AUR packages installed
`hooks/` | All the pacman hook configs
`archinstall.sh` | Arch Linux automatic installer

# Prerequisites
Assume you are using Arch Linux in which the package manager is `pacman`.
## archinstall.sh
Kindly check and manually edit the partition name format in `select_device`.
## Emacs
Use [Centaur Emacs](https://github.com/seagle0128/.emacs.d) as the configuration
base.
`custom*.el` refer(s) to my customization upon Centaur Emacs.
## RLS (Rust Language Server)
If you want to use RLS, you need to add following components in rustup:
```
rustup component add rls rust-src rust-analysis
```
Then use `cargo build` in your project root folder for the first time.

# Usage
Simply override your own configs.

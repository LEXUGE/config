# Config
Harry Ying's configs

# File description
File | Description
--- | ---
`emacs/` | Emacs configs
`package-list/` | Folder for package lists, including AUR and non-AUR
`hooks/` | All the pacman hook configs
`scripts/` | All the scripts that help you to utilize configs

# Prerequisites
Assume you are using Arch Linux in which the package manager is `pacman`.
## archinstall.sh
Kindly check and manually edit the partition name format in `select_device`.
## git.sh
Have my secret key imported.
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

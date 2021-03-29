# dotfiles
My dotfiles. I keep my general (cross-platform) files in [general](general) and my system-specific files in [arch](arch) and [mac](mac) respectfully.

I mainly use Linux (because it's better and I like it much more, especially for development) but I try to maintain my Mac configuration too.

For shell scripts, I recommend dash. On Arch Linux you can use [dashbinsh](https://aur.archlinux.org/packages/dashbinsh/) to symlink it to `/bin/sh`.

## How to install configs

I use [GNU stow](https://www.gnu.org/software/stow/manual/stow.html) to make these easy to symlink. General files should be stowed regardless of operating system. 

For Arch Linux:
```
stow general
stow arch
```
For MacOS:
```
stow general
stow mac
```
To un-stow things:
```
stow -D package-name
```

## How to install scripts

This will install all scripts (including the ones that are only intended for Arch Linux):
```
stow scripts
```

To add these scripts to my PATH easily, I added the following line to my .xinitrc for Linux:
```
export PATH=$PATH:$(find ${XDG_DATA_HOME:-$HOME/scripts} -maxdepth 1 -type d | paste -sd ":" -)
```
I don't know what the best way to do this on Mac would be, but since I don't use most of those scripts on Mac anyway, I haven't bothered. I only use the cmake scripts on Mac, so I just made aliases to them.

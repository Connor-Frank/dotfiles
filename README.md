# dotfiles
My dotfiles. I keep my general (cross-platform) files in [general](general) and my system-specific files in [arch](arch) and [mac](mac) respectfully.

I mainly use Linux (because it's better and I like it much more, especially for development) but I try to maintain my Mac configuration too.

For shell scripts, I use dash. On Arch Linux you can use [dashbinsh](https://aur.archlinux.org/packages/dashbinsh/) to symlink it to `/bin/sh`.

## Attributions

For Neovim, I use [Chris Chiarulli's](https://github.com/ChristianChiarulli) config, [nvcode](https://github.com/ChristianChiarulli/nvcode). I've made some tweaks here and there and I intend to change more of it eventually, but it's mostly his work for now.

Most of my dwmblocks shell scripts were inspired by (if not copied from) [Luke Smith](https://github.com/LukeSmithxyz). His repo with them is [here](https://github.com/LukeSmithxyz/voidrice/tree/master/.local/bin/statusbar) if you want to check them out.

## How to install configs

Make sure to clone submodules, otherwise Neovim or zsh syntax highlighting won't work:
```
git submodule update --init
```

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
To un-stow things, use `stow -D <package-name>`, and to re-stow things, use `stow -R <package-name>`.

## Notes on the scripts

To add scripts in `~/.local/bin` to my PATH easily, I added the following lines to my `~/.zprofile` for Linux:
```
# add scripts to PATH
typeset -U PATH path
BINPATH="$HOME/.local/bin"
path+=("$BINPATH" "${BINPATH}"/*/)
export PATH
```
Credit: [https://unix.stackexchange.com/a/552849](https://unix.stackexchange.com/a/552849)


I don't know what the best way to do this on Mac would be, but since I don't use most of those scripts on Mac anyway, I haven't bothered. I only use the cmake scripts on Mac, so I just made aliases to them.

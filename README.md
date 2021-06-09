# dotfiles
My dotfiles. I keep my general (cross-platform) files in [general](general) and my system-specific files in [arch](arch) and [mac](mac) respectfully.

I mainly use Linux (because it's better, more lightweight, more secure, and I like it much more, especially for development) but I try to maintain my Mac configuration too, because having a "normie" machine is necessary sometimes for school. I'd like to be able to have a similar workflow if I ever need to do some coding on a Mac.

For shell scripts, I use dash. On Arch Linux you can use [dashbinsh](https://aur.archlinux.org/packages/dashbinsh/) to symlink it to `/bin/sh`. On other distributions you can do it manually using `sudo ln -sf dash /bin/sh`.

## Attributions

Most of my dwmblocks shell scripts were inspired by (if not copied from) [Luke Smith](https://github.com/LukeSmithxyz). His repo with them is [here](https://github.com/LukeSmithxyz/voidrice/tree/master/.local/bin/statusbar) if you want to check them out.

## How to install configs

Make sure to clone submodules, otherwise zsh syntax highlighting won't work:
```
git submodule update --init
```

There are two scripts to link configs, the aptly-named `link.sh` and `unlink.sh`. Run these scripts using either `./link.sh` or `./unlink.sh`, depending on which one you need.

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

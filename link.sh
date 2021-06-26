#!/bin/sh

if [ "$(uname -s)" = "Darwin" ]; then
  ln -s ~/dotfiles/general/.config/* ~/.config
  ln -s ~/dotfiles/general/.vim ~
  ln -s ~/dotfiles/mac/.zshrc ~/.zshrc
  ln -s ~/dotfiles/mac/.local/* ~/.local
  ln -s ~/dotfiles/mac/.iTerm ~
else
  ln -sf ~/dotfiles/general/.config/* ~/.config
  ln -sf ~/dotfiles/general/.vim ~
  ln -sf ~/dotfiles/linux/.zprofile ~/.zprofile
  ln -sf ~/dotfiles/linux/.zshrc ~/.zshrc
  ln -sf ~/dotfiles/linux/.config/* ~/.config
  ln -sf ~/dotfiles/linux/.local/bin/* ~/.local/bin
  ln -sf ~/dotfiles/linux/.local/src/* ~/.local/src
  ln -sf ~/dotfiles/linux/.local/wallpapers/* ~/.local/wallpapers
fi

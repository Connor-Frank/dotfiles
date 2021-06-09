#!/bin/sh

if [ "$(uname -s)" = "Darwin" ]; then
  ln -s ~/dotfiles/general/.config/* ~/.config
  ln -s ~/dotfiles/general/.vim ~
  ln -s ~/dotfiles/mac/.zshrc ~/.zshrc
  ln -s ~/dotfiles/mac/.local/* ~/.local
  ln -s ~/dotfiles/mac/.iTerm ~
else
  ln -s ~/dotfiles/general/.config/* ~/.config
  ln -s ~/dotfiles/general/.vim ~
  ln -s ~/dotfiles/linux/.zprofile ~/.zprofile
  ln -s ~/dotfiles/linux/.zshrc ~/.zshrc
  ln -s ~/dotfiles/linux/.config/* ~/.config
  ln -s ~/dotfiles/linux/.local/* ~/.local
fi

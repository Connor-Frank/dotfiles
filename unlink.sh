#!/bin/sh

find -L ~ -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.config -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.local/bin -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.local/src -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.local/wallpapers -maxdepth 1 -xtype l -exec unlink {} \;

#!/bin/sh

find -L ~ -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.config -maxdepth 1 -xtype l -exec unlink {} \;
find -L ~/.local -maxdepth 1 -xtype l -exec unlink {} \;

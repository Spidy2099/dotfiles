#!/bin/bash

########################
# Config file for nvim #
########################
mkdir -p "$HOME/.config/nvim"       # Create nvim config dir to avoid error
mkdir -p "$HOME/.config/nvim/undo"  # Create nvim config dir to avoid erro
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"  # Create soft link to config file 

############################
# Config file for X server #
############################
rm -rf "$HOME/.config/X11"
ln -s "$HOME/dotfiles/X11" "$HOME/.config"  # Create a symlink targeting the whole directory X11 because everything in this directory should be shared between systems.

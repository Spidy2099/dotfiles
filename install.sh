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

#############
# i3 config #
#############
rm -rf "$HOME/.config/i3"                   # delete the original config file
ln -s "$HOME/dotfiles/i3" "$HOME/.config"   # create a symlink targeting the whole i3 directory config file

##############
# zsh config #
##############
mkdir -p "$HOME/.config/zsh"  # Create the zsh config file
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME" # Create a symlink targeting .zshenv to $HOME
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh" # Create a symlink targeting .zshrc to .config
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases" # Target aliases setting file to .config

rm -rf "$HOME/.cofig/zsh/external"  
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"  # Target external dir to .config

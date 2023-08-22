#!/bin/bash

########################
# Config file for nvim #
########################
mkdir -p "$XDG_CONFIG_HOME/nvim"       # Create nvim config dir to avoid error
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"  # Create nvim config dir to avoid erro
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"  # Create soft link to config file 

###############################
# Nvim Plugin Manager Install #
###############################
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"
# Install or upadate all the plugins
nvim --noplugin +PlugUpdate +qa

############################
# Config file for X server #
############################
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"  # Create a symlink targeting the whole directory X11 because everything in this directory should be shared between systems.

#############
# i3 config #
#############
rm -rf "$XDG_CONFIG_HOME/i3"                   # delete the original config file
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"   # create a symlink targeting the whole i3 directory config file

##############
# zsh config #
##############
mkdir -p "$XDG_CONFIG_HOME/zsh"  # Create the zsh config file
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME" # Create a symlink targeting .zshenv to $HOME
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh" # Create a symlink targeting .zshrc to .config
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases" # Target aliases setting file to .config

rm -rf "$HOME/.cofig/zsh/external"  
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"  # Target external dir to .config

###################
# Fonts resources #
###################
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"   # don't create symbolic link, because the font file will never be modified

################
# Dunst config #
################
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc" 



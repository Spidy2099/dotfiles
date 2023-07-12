# Set environment variables for Zsh
# Path for config file
export XDG_CONFIG_HOME="$HOME/.config"

# Path for specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# Path for cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Set Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Set config files for Zsh to load
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# History filepath (Remember do not git this file)
export HISTFILE="$ZDOTDIR/.zhistory"
# Maximum events for internal history
export HISTSIZE=10000
# Maximum events in history file
export SAVEHIST=10000

# Set dotfile path
export DOTFILES="$HOME/dotfiles"

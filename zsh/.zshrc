# Source alias file
source "$XDG_CONFIG_HOME/zsh/aliases"

# Initialize completion for Zsh by calling the function compinit
# Zsh will find the file compinit and load it as a function
# 1.Autoload will not load executable file so it avoids name conflict
# 2.The command with '-U' in file being autoloaded will not be aliased by shell, so it avoids expand aliases
# 3.-z means the function is written using "Zsh style"
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots) #This line is used to make auto-completion work for dotfiles(don't know what it means)
# completion.zsh is a file from the Zsh framework prezto(a configuration framework for Zsh which enriches the CLI environment), it improves the auto-completion system
source ~/dotfiles/zsh/external/completion.zsh

# Set the path where things in this path will be autoloaded, which is zsh/external
fpath=($ZDOTDIR/external $fpath)

# Source the alias file
source "$XDG_CONFIG_HOME/zsh/aliases"

# Set the zsh options
setopt AUTO_PARAM_SLASH     # It will add a slash(/) at the end of the completed name if it is a directory
unsetopt CASE_GLOB          # Pattern match will be case-sensitive

#Zsh Completion System
# To initialize completion for the current Zsh session, we need to call the function compinit
autoload -Uz compinit; compinit
# The command `autoload` will load file containing shell commands or as function. 
# The loaded file-path is defined in $fpath, in this path should zsh find the file 'compinit'
# Using 'autoload' instead of 'source'
# 1.`autoload` will not load executable file, but 'source' will raise name cofict if there are shell-command file and executable file with the same name.
# 2.`autoload` with '-U' option will not expand any aliased that are defined in shell
# 3.`autoload` will load the function only when it's needed, which speeds up Zsh startup
#'-z' option tells Zsh the function is written using "Zsh style"

# Autocomplete dot(hidden) files
_comp_options+=(globdots) #This line is used to make auto-completion work for dotfiles(add the 'globdots' option to the '_comp_options' array(an internal array that sores the completion options), this option enables the matching of dotfiles(hidden files) when using glob patterns.)
source ~/dotfiles/zsh/external/completion.zsh
# completion.zsh is a file from the Zsh framework prezto(a configuration framework for Zsh which enriches the CLI environment), it improves the auto-completion system
# The file is get from github, the content should be carefully read after learning the Zsh official guid

# The directory "zsh/external" stores everything that we download from web instead of writing these settings on my own
# Set the path where things in this path will be autoloaded, which is zsh/external. Note that it is at the font positon, so Zsh will first search in this directory for any function we want to autoload
fpath=($ZDOTDIR/external $fpath)

# The prompt setting of Zsh
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push and pop directories on a directory stack with Zsh
# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# Enabling the Vi Mode
bindkey -v  # use vi-like keybinding
export KEYTIMEOUT=1
# Load the script that changes the cursor's figure to differ the INSERT or NORMAL MODE
autoload -Uz cursor_mode && cursor_mode
# Set up keys 'hjkl' to navigate the auto-completion menu
zmodload zsh/complist   # load the Zsh module 'complist', wich give access to menuselect
bindkey -M menuselect 'h' vi-backward-char  # bindkey -M binds a key to the command menuselect
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Edit commands in neovim
autoload -Uz edit-command-line  # This function allows to edit the command using the default text editor
zle -N edit-command-line
bindkey -M vicmd n edit-command-line   # use 'n' in Normal mode to edit a command in editor. add vicmd to 'bindkey -M', the keystroke will conly work in NORMAL mode.

# Using `bd` command to jump to a parent dirtory
source ~/dotfiles/zsh/external/bd.zsh

# Custom Scripts
source $DOTFILES/zsh/scripts.sh

# Sources fzf completion for Zsh and create some key bindings
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi
# ask fzf to use ripgrep(alternative to grep) by default when we search for files.
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Configure i3 to startup
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi

# CTRL + l used in tumux, so change the keystroke for clean the screen
bindkey -r '^l' # unbind ctrl+l
bindkey -r '^g' # unbind ctrl+g
bindkey -s '^g' 'clear\n' # bind ctrl+g as clear screen


#Zsh Syntax Highlighting(place it at the bottom of zshrc, so everything loaded before will be able to use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh   # source the plugin 'zsh-syntax-highlighting'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set bash prompt
export PS1="\[\033[38;5;39m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;110m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;135m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]"

# Set some general environment variables
export EDITOR="nvim"
export CLICOLOR="1"
export EMAIL="hi@hbjy.dev"

# Append things to PATH
export PATH="$PATH:$HOME/.local/bin"

# Include any shell aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Include Nix configuration
[[ -f /etc/profile.d/nix.sh ]] && source /etc/profile.d/nix.sh

# Include FZF completion & bindings
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

# Include secrets (shhh)
[[ -f $HOME/.secrets ]] && source $HOME/.secrets

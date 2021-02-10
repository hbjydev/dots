# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set bash prompt
#export PS1="\[\033[38;5;9m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;81m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export PS1="\[$(tput bold)$(tput setaf 1)\]\u\[$(tput sgr0)$(tput dim)$(tput setaf 7)\]@\[$(tput sgr0)$(tput setaf 2)\]\h\[$(tput sgr0)\] \[$(tput setaf 7)$(tput dim)\]\W\[$(tput sgr0)\] "

# Set some general environment variables
export EDITOR="nvim"
export CLICOLOR="1"
export EMAIL="hi@hbjy.dev"

# Set terminal type for compatibility
TERM=screen-256color

# Append things to PATH
export PATH="$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.symfony/bin"

# Set terminal window name
case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
     PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

# Include any shell aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

# Include Nix configuration
[[ -f /etc/profile.d/nix.sh ]] && source /etc/profile.d/nix.sh

# Include FZF completion & bindings
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

# Include Rust toolchain environment
[[ -f $HOME/.cargo/env ]] && source "$HOME/.cargo/env"

# Include secrets (shhh)
[[ -f $HOME/.secrets ]] && source $HOME/.secrets

# Add GitHub CLI completion if `gh` is installed
if command -v gh &> /dev/null; then
  eval "$(gh completion -s bash)"
fi

# Allow use of GPG (YK) for SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Add Cargo's bin directory to PATH
source "$HOME/.cargo/env"

unset PROMPT_COMMAND

# Include autocompletion for molecule
if command -v molecule &> /dev/null; then
  eval "$(_MOLECULE_COMPLETE=source molecule)"
fi

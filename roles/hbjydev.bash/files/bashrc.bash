# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set bash prompt
export PS1="\[\033[38;5;39m\]\u\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;110m\]\W\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;135m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;7m\]"

# Set some general environment variables
export EDITOR="vim"
export CLICOLOR="1"
export EMAIL="hi@hbjy.dev"

# Set terminal type for compatibility
TERM=xterm-256color

# Append things to PATH
export PATH="$PATH:$HOME/.local/bin"

# Include base16 shell theme
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_atelier-cave

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

# Include secrets (shhh)
[[ -f $HOME/.secrets ]] && source $HOME/.secrets
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

which gh && eval "$(gh completion -s bash)"

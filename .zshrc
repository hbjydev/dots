#
# oh my zsh
#
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#
# extras
#
license () {
  curl -L "api.github.com/licenses/$1" | jq -r .body > LICENSE
}

if [[ -f "$HOME/.secrets" ]]; then
  source "$HOME/.secrets"
fi

if [[ -d "$HOME/.gvm" ]]; then
    . "$HOME/.gvm/scripts/gvm"
fi

if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
        printf %s "${HOME}/.nvm" || \
        printf %s "${XDG_CONFIG_HOME}/nvm")"

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

if [[ -x "$(which direnv)" ]]; then
    eval "$(direnv hook zsh)"
fi

if [ -e /home/hayden/.nix-profile/etc/profile.d/nix.sh ]; then
    . /home/hayden/.nix-profile/etc/profile.d/nix.sh
    export NIX_PATH="$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}"
fi

export KEG_CURRENT="$HOME/keg"

#
# aliases
#
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcl="docker compose logs"
alias dclf="docker compose logs -f"
alias dcc="docker compose cp"
alias dci="docker compose inspect"
alias dce="docker compose exec"
alias dcr="docker compose restart"

alias k="kubectl"
alias kw="kubectl -o wide"
alias ky="kubectl -o yaml"
alias kj="kubectl -o json"

alias tf="terraform"

alias gs="git status -s"
alias ga="git add"
alias gc="git commit"
alias gch="git checkout"
alias gb="git branch"
alias gp="git pull"
alias gpp="git push"
alias gl="git log --pretty=oneline --abbrev-commit"

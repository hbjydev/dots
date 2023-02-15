##
## oh my zsh
##
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

test -r ~/.shell-common && source ~/.shell-common
test -r ~/.shell-env && source ~/.shell-env
test -r ~/.shell-aliases && source ~/.shell-aliases

test -d "$HOME/.secrets" && source "$HOME/.secrets"
test -d "$HOME/.gvm" && source "$HOME/.gvm/scripts/gvm"
test -d "$HOME/.cargo" && source "$HOME/.cargo/env"
test -d "$HOME/.krew" && export PATH="$PATH:$HOME/.krew/bin"
command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"

test -f "$HOME/.config/op/plugins.sh" && source "$HOME/.config/op/plugins.sh"

if [[ -d "$HOME/.nvm" ]]; then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && \
        printf %s "${HOME}/.nvm" || \
        printf %s "${XDG_CONFIG_HOME}/nvm")"

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

if [ -d $BREW_PREFIX ]; then
  eval "$($BREW_PREFIX/bin/brew shellenv)"
  fpath=($BREW_PREFIX/share/zsh/site-functions $fpath)
fi

if [ -d $HOME/.nix-profile ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
  fpath=($HOME/.nix-profile/share/zsh/site-functions $fpath)
fi

license () {
  curl -L "api.github.com/licenses/$1" | jq -r .body > LICENSE
}

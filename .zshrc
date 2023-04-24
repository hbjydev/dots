##
## oh my zsh
##
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(aws npm brew direnv pyenv git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

test -r ~/.shell-common && source ~/.shell-common
test -r ~/.shell-env && source ~/.shell-env
test -r ~/.shell-aliases && source ~/.shell-aliases

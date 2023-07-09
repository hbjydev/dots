#!/usr/bin/env bash

. "$HOME/.config/yadm/bootstrap-shared.sh"

##
## configuration
##

install_packages=(
    git
    google-chrome-stable
    httpie
    wezterm
    neovim
    unzip
    zip
    zsh
)

##
## setup
##

install_fonts()
{
    mkdir -p "$HOME/.local/share/fonts"

    if [[ ! -f "$HOME/.local/share/fonts/Fira Code Regular Nerd Font Complete.ttf" ]]; then
        curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip -o /tmp/FiraCode.zip
        cd "$HOME/.local/share/fonts" && unzip -o /tmp/FiraCode.zip
        rm /tmp/FiraCode.zip
    fi

    if [[ ! -f "$HOME/.local/share/fonts/Mononoki Nerd Font Complete.ttf" ]]; then
        curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Mononoki.zip -o /tmp/Mononoki.zip
        cd "$HOME/.local/share/fonts" && unzip -o /tmp/Mononoki.zip
        rm /tmp/Mononoki.zip
    fi

    fc-cache -fv
}

install_docker()
{
    if ! sudo pacman -Q docker &>/dev/null; then
        sudo pacman -Sy docker docker-compose
        sudo systemctl enable --now docker.service
    fi

    if ! grep -e docker /etc/passwd &>/dev/null; then
        sudo groupadd docker
    fi

    if ! groups hayden | grep -q '\bdocker\b'; then
        sudo usermod -aG docker "$USER"
    fi
}

install_1password()
{
    if ! pacman -Q 1password &>/dev/null; then
        yay -Sy 1password
    fi

    if ! rpm -q 1password-cli &>/dev/null; then
        yay -Sy 1password-cli
    fi
}

yay -Syu
yay -Sy "${install_packages[@]}"

test -d "$HOME/.config/nvim" || git clone gh:hbjydev/init.lua "$HOME/.config/nvim"

install_brew
install_nix
install_omzsh
install_docker
install_fonts
install_1password
install_nvm

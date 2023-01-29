#!/usr/bin/env bash

. ./bootstrap-shared.sh

##
## configuration
##

remove_packages=(
    firefox
    'libreoffice-*'
)

copr_repos=(
    agriffis/neovim-nightly
)

repo_files=()

install_packages=(
    '@Development Tools'
    'dnf-command(copr)'
    gh
    git
    google-chrome-stable
    kitty
    neovim
    unzip
    zip
    zsh
)

##
## setup
##

dnfcmd="sudo dnf -y"

install_chrome_repo()
{
    if [[ -f /etc/yum.repos.d/google-chrome.repo ]]; then
    sudo tee /etc/yum.repos.d/google-chrome.repo > /dev/null <<EOT
[google-chrome]
name=google-chrome
baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOT
    fi
}

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
    if ! rpm -q docker-ce &>/dev/null; then
        $dnfcmd config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
        $dnfcmd install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        sudo systemctl enable --now docker.service
    fi

    if ! groups hayden | grep -q '\bdocker\b'; then
        sudo usermod -aG docker "$USER"
    fi
}

install_1password()
{
    if [[ ! -f /etc/yum.repos.d/1password.repo ]]; then
        sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
        sudo tee /etc/yum.repos.d/1password.repo > /dev/null <<EOT
[1password]
name=1Password Beta Channel
baseurl=https://downloads.1password.com/linux/rpm/beta/\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey="https://downloads.1password.com/linux/keys/1password.asc"
EOT
    fi

    if ! rpm -q 1password &>/dev/null; then
        $dnfcmd install 1password
    fi

    if ! rpm -q 1password-cli &>/dev/null; then
        $dnfcmd install 1password-cli
    fi
}

$dnfcmd update
$dnfcmd remove "${remove_packages[@]}"

install_chrome_repo

for repo in "${copr_repos[@]}"
do
    $dnfcmd copr enable "$repo"
done

for repo in "${repo_files[@]}"
do
    $dnfcmd config-manager --add-repo "$repo"
done

$dnfcmd install "${install_packages[@]}"

test -d "$HOME/.config/nvim" || git clone gh:hbjydev/init.lua "$HOME/.config/nvim"

install_brew
install_nix
install_omzsh
install_docker
install_fonts
install_1password
install_nvm

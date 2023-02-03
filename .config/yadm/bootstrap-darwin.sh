#!/usr/bin/env bash

. "$HOME/.config/yadm/bootstrap-shared.sh"

install_fonts()
{
    fonts_dir="$HOME/Library/Fonts"
    nf_release="v2.3.3"

    mkdir -p "$fonts_dir"

    if [[ ! -f "$fonts_dir/Fira Code Regular Nerd Font Complete.ttf" ]]; then
        curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/$nf_release/FiraCode.zip" -o /tmp/FiraCode.zip
        cd "$fonts_dir" && unzip -o /tmp/FiraCode.zip
        rm /tmp/FiraCode.zip
    fi

    if [[ ! -f "$fonts_dir/Mononoki Nerd Font Complete Regular.ttf" ]]; then
        curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/$nf_release/Mononoki.zip" -o /tmp/Mononoki.zip
        cd "$fonts_dir" && unzip -o /tmp/Mononoki.zip
        rm /tmp/Mononoki.zip
    fi
}

install_fonts
install_brew
install_nix
install_omzsh
install_nvm

# Now everything is installed, we can run any of our own stuff.
defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/.iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

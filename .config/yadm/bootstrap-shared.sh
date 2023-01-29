#!/usr/bin/env bash

# This file stores shared functions for use on MacOS or Linux.

install_brew ()
{
    if ! command -v brew >/dev/null 2>&1; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
    fi

    if [ -f "$HOME/.Brewfile" ]; then
        echo "Updating Homebrew bundle"
        brew bundle --global
    fi
}

install_nix ()
{
  # This one courtesy of:
  # https://github.com/shadowrylander/shadowrylander/blob/35bb51822c46578d0a5da5810263fa85d464043c/.config/yadm/bootstrap#L56
  install_nix_bin() {
    curl -L https://nixos.org/nix/install | sh
    if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
      . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
    fi
  }
  command -v nix >/dev/null 2>&1 || install_nix_bin

  if [ -f "$HOME/.config/nix/installed_packages" ]; then
    # This list created with `nix-env -qaPs|grep '^I'|awk '{print $2}' > ~/.config/nix/installed_packages`
    xargs nix-env -iA < "$HOME/.config/nix/installed_packages"
  fi
  if [ -f "$HOME/.config/nix/installed_packages.local" ]; then
    # Additional packages that might be needed here or there
    xargs nix-env -i < "$HOME/.config/nix/installed_packages.local"
    #cat "$HOME/.config/nix/installed_packages.local" | xargs nix-env -i
  fi
}

install_omzsh()
{
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        KEEP_ZSHRC=yes RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi

    if [[ "$(uname -s)" = "Linux" && "$NO_ZSH_SET" != "1" ]]; then
        sudo usermod -s /bin/zsh "$USER"
    fi

    if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
        mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    fi

    if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
        mkdir -p "$HOME/.oh-my-zsh/custom/plugins"
        git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    fi
}

install_nvm()
{
    if [[ ! -d "$HOME/.nvm" ]]; then
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        nvm install --lts
    fi
}

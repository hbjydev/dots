#!/usr/bin/env bash
set -e

# Dotfiles directory
export ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export HOSTS="$ROOTDIR/inventory.cfg"

# Main playbook
export PLAYBOOK="$ROOTDIR/setup.yml"

# Installs Ansible
which ansible || (yay -Syu && yay -S --noconfirm ansible)

# Runs Ansible playbook using our user
ansible-playbook -i "$HOSTS" "$PLAYBOOK" --ask-become-pass

exit 0

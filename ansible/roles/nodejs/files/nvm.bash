#!/bin/bash

# This bashrc file sets up nvm and its environment variables, assuming nvm is
# installed. This file is managed by Ansible, but is symlinked to allow changes
# to be made without re-deploying the associated playbooks.

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

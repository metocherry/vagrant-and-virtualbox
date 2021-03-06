#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source ~/.nvm/nvm.sh

nvm install --lts
node -v
npm -v

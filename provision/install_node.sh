#!/bin/sh

cd /home/vagrant

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts
nvm alias default node

npm install -g gulp-cli

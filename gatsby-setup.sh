#!/usr/bin/env bash

mkdir -p "$(nodenv root)"/plugins

NODE_BUILD_PATH="$(nodenv root)"/plugins/node-build
if [ -e "${NODE_BUILD_PATH}" ]; then
    git -C "${NODE_BUILD_PATH}" pull >/dev/null
else
    git clone https://github.com/nodenv/node-build.git "${NODE_BUILD_PATH}"
fi

NODE_UPDATE_PATH="$(nodenv root)"/plugins/nodenv-update
if [ -e "${NODE_UPDATE_PATH}" ]; then
    git -C "${NODE_UPDATE_PATH}" pull >/dev/null
else
    git clone https://github.com/nodenv/nodenv-update.git "${NODE_UPDATE_PATH}"
fi

eval "$(nodenv init -)"

NODE_LATEST_STABLE_VERSION=`nodenv install -l | grep -E "^[0-9]" | tail -n 1`

[ ! -e "$(nodenv root)"/versions/$NODE_LATEST_STABLE_VERSION ] && nodenv install $NODE_LATEST_STABLE_VERSION

nodenv global $NODE_LATEST_STABLE_VERSION
nodenv shell $NODE_LATEST_STABLE_VERSION

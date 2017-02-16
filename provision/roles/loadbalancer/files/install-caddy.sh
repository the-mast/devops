#!/bin/sh

# install caddy if /usr/bin/caddy doesn't exist
[[ ! -f /usr/bin/caddy ]] && \
    curl https://getcaddy.com | bash -s cors


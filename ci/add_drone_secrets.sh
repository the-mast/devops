#!/usr/bin/env sh

set -e

export IP_ADDRESS=$1
export REMOTE_RSA_KEY=$(cat $2)

function setup_drone_ci(){
  source env.sh

  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/the-mast-theme \
    GITHUB_TOKEN $GITHUB_TOKEN
  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/the-mast-theme \
    REMOTE_IP_ADDRESS $IP_ADDRESS
  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/the-mast-theme \
    REMOTE_RSA_KEY "$REMOTE_RSA_KEY"

  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/webstarterkit-spike \
    GITHUB_TOKEN $GITHUB_TOKEN
  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/webstarterkit-spike \
    REMOTE_IP_ADDRESS $IP_ADDRESS
  drone secret add --conceal --image=themast/docker-wp-theme-build:latest \
    the-mast/webstarterkit-spike \
    REMOTE_RSA_KEY "$REMOTE_RSA_KEY"
}

function main(){
    setup_drone_ci
}

main $@


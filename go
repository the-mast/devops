#!/bin/sh

function init() {
  [[ ! -d .vagrant ]] && vagrant up
  [[ ! -f vagrant_ssh_config ]] && vagrant ssh-config > vagrant_ssh_config
}

function reload_apache(){
  echo 'reloading apache...'
  vagrant ssh sudo service apache2 restart
}

function main() {
  case $1 in
    'reload')
      reload_apache
      ;;
    *)
      init
      ;;
  esac
}

main $@

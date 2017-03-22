#!/bin/sh

export ENV_FILE="$1_env.sh"
export HOSTS_FILE="$2"
. "$ENV_FILE"
ansible-playbook -v playbooks/backup_wordpress.yml -i "$HOSTS_FILE"

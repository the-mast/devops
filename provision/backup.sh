#!/bin/sh

#$1 is the system name e.g. the_mast | news_day_africa
#$2 is the hosts file to use
export ENV_FILE="$1_env.sh"
export HOSTS_FILE="$2"
. "$ENV_FILE"
ansible-playbook -v playbooks/backup_wordpress.yml -i "$HOSTS_FILE"

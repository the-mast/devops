#!/bin/sh

. env.sh
ansible-playbook -v playbooks/backup_wordpress.yml -i vagrantHosts.ini

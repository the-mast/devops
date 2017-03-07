#!/bin/sh

. env.sh
ansible-playbook -v site.yml -i vagrantHosts.ini -l green

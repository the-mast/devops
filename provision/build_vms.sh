#!/bin/sh

. env.sh
ansible-playbook site.yml -i vagrantHosts.ini -l [blue,green]

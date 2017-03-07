#!/bin/sh

. env.sh
ansible-playbook -v switch.yml -i hosts.ini

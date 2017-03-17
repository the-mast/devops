#!/bin/sh

. env.sh
ansible-playbook -v playbooks/putDBsToReadonly.yml -i hosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/backup_wordpress.yml -i hosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/clearBox.yml \
    -i hosts.ini\
    -l staging\
    --extra-vars "data_env=production"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v site.yml\
    -i hosts.ini\
    -l staging
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/restoreUploads.yml\
    -i hosts.ini\
    -l staging
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/enableDBWrites.yml\
    -i hosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v switch.yml -i hosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

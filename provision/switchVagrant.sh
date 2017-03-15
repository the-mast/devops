#!/bin/sh

. env.sh
ansible-playbook -v playbooks/putDBsToReadonly.yml -i vagrantHosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/backup_wordpress.yml -i vagrantHosts.ini
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/clearBox.yml -i vagrantHosts.ini -l production
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v site.yml -i vagrantHosts.ini -l production
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/restoreUploads.yml -i vagrantHosts.ini -l production
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/enableDBWrites.yml -i vagrantHosts.ini

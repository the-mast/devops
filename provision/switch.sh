#!/bin/sh

export ENV_FILE="$1_env.sh"
export HOSTS_FILE="$2"
. "$ENV_FILE"

ansible-playbook -v playbooks/putDBsToReadonly.yml -i "$HOSTS_FILE"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/backup_wordpress.yml -i "$HOSTS_FILE"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/clearBox.yml \
    -i "$HOSTS_FILE"\
    -l staging\
    --extra-vars "data_env=production"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v site.yml\
    -i "$HOSTS_FILE"\
    -l staging
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/restoreUploads.yml\
    -i "$HOSTS_FILE"\
    -l staging
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v playbooks/enableDBWrites.yml\
    -i "$HOSTS_FILE"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

ansible-playbook -v switch.yml -i "$HOSTS_FILE"
if [ $? != 0 ]; then
    echo "exiting"
    exit 1
fi

#!/bin/bash
date
export  ANSIBLE_HOST_KEY_CHECKING=false; 
ansible-playbook --inventory-file=./inventory_file ./ec2_start_stop_desc.yml #\
#--check \
#--diff 
#--syntax-check
# --start-at-task=START_AT_TASK   #start the playbook at the task matching this name
#--step                #one-step-at-a-time: confirm each task before running
#-t TAGS, --tags=TAGS  only run plays and tasks tagged with these values
date

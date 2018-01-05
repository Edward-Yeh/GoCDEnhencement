#!/bin/bash
date
export  ANSIBLE_HOST_KEY_CHECKING=false; 
echo "Start instances..."
#DropApOpsDev-dw002(Running priority = none)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-0cf4e1d5df8f8b944"
#DropApOpsDev-RS001(Running priority = none)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-04f0f95eb15de1425"
#DropApOpsDev-mec-redis001(Running priority = 1)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-046254f80e3cf985b"
ansible-playbook --inventory=./hosts set_redis_config.yml
#DropApOpsDev-NS001(Running priority = 2)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-0eb0d9d7940242f4c"
ansible-playbook --inventory=./hosts set_ns_config.yml
#DropApOpsDev-mec001(Running priority = 3)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-07076ccce4c4ef7a0"
ansible-playbook --inventory=./hosts set_mec_config.yml
#DropApOpsDev-CoreDB001(Running priority = 4)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-0a0f1f0bf1e599f4c" --skip-tags=wait_ssh
#DropApOpsDev-CoreDB002(Running priority = 5)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-0f162b7267af9fcf6" --skip-tags=wait_ssh
#DropApOpsDev-serm001(Running priority = 6)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-00a40e2c8ab64caf4"
ansible-playbook --inventory=./hosts set_serm_config.yml
#DropApOpsDev-serm002(Running priority = 6)
ansible-playbook --inventory=./hosts ec2_start.yml --extra-vars "aws_region=us-west-1 instance_id=i-04211ab4466f9680f"
date

#!/bin/bash
date
export  ANSIBLE_HOST_KEY_CHECKING=false; 
echo "Stop instances..."
#DropApOpsDev-RS001(Running priority = none)
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-04f0f95eb15de1425"
#DropApOpsDev-dw002(Running priority = none)
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-0cf4e1d5df8f8b944"
#DropApOpsDev-serm002(Running priority = 6)
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-04211ab4466f9680f"
#DropApOpsDev-serm001(Running priority = 6)
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-00a40e2c8ab64caf4"
#DropApOpsDev-CoreDB002(Running priority = 5) 
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-0f162b7267af9fcf6"
#DropApOpsDev-CoreDB001(Running priority = 4) 
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-0a0f1f0bf1e599f4c"
#DropApOpsDev-mec001(Running priority = 3)
ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-07076ccce4c4ef7a0"
#DropApOpsDev-NS001(Running priority = 2)
#ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-0eb0d9d7940242f4c"
#DropApOpsDev-mec-redis001(Running priority = 1)
#ansible-playbook --inventory=./inventory_file ec2_stop.yml --extra-vars "aws_region=us-west-1 instance_id=i-046254f80e3cf985b"
echo "Finish..."
date

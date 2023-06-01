#!/bin/bash

# Execute Local Machine and VM Configuration
printf "Configuring Virtual Machine"
echo
sudo ansible-playbook configure_local_and_vm.yml
sleep 5
# Execute Application Deployment
printf "Configuring Virtual Machine"
echo
sudo ansible-playbook -i hosts.ini deploy_clock_app.yml

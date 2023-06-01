#!/bin/bash

# Create the main project directory
mkdir clock_app
cd clock_app || exit

# Create the necessary subdirectories
mkdir inventory playbooks roles group_vars

# Create inventory/hosts file
touch inventory/hosts.ini

# Create playbooks/site.yml file
touch playbooks/site.yml

# Create roles/backend directory and necessary subdirectories
mkdir -p roles/backend/tasks roles/backend/templates

# Create roles/frontend directory and necessary subdirectories
mkdir -p roles/frontend/tasks roles/frontend/templates

# Create group_vars/all.yml file
touch group_vars/all.yml

# Create ansible.cfg file
touch ansible.cfg

echo "Ansible project structure created successfully!"

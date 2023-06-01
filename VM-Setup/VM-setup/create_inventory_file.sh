#!/bin/bash

# Define inventory file path
inventory_file="$(pwd)/clock_app/inventory/hosts.ini"

# Create the inventory file
cat <<EOF >"$inventory_file"
[server]
servername ansible_host=192.168.122.188
localhost

[server:vars]
ansible_user=admin
ansible_password="asdf"
EOF

# Replace servername placeholder with the actual server name
sed -i "s/servername/web_clock/" "$inventory_file"

echo "Inventory file created successfully at $inventory_file"

echo "Testing Connection to host"
ansible -i clock_app/inventory/hosts.ini web_clock -m ping

#!/bin/bash

# Create the user
useradd -m admin

# Set the password for the user
echo "admin:asdf" | chpasswd

# Add the user to the sudoers group
usermod -aG sudo admin

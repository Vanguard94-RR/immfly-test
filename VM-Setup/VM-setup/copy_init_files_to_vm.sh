#!/bin/bash

sudo scp -i rsa vm_install_dependencies_and_docker.sh create_user.sh root@192.168.122.188:/home/admin/clock_app/

sudo ssh -i rsa root@192.168.122.188 'chmod +x /home/admin/clock_app/*.sh'

sudo ssh -i rsa root@192.168.122.188 './home/admin/clock_app/create_user.sh'

sudo ssh -i rsa root@192.168.122.188 './home/admin/clock_app/vm_install_dependencies_and_docker.sh'

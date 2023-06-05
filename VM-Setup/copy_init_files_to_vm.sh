#!/bin/bash

sudo chmod 400 /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'bash /home/admin/clock_app/create_user.sh'

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'mkdir /home/admin/clock_app'

sudo scp -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa vm_install_dependencies_and_docker-compose.sh create_user.sh root@192.168.122.188:/home/admin/clock_app/

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'chmod +x /home/admin/clock_app/*.sh'

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'chmod ugo+rw clock_app'

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2'

sudo ssh -i /home/mint/Documents/immfly-test/VM-Setup/VM-setup/rsa root@192.168.122.188 'bash /home/admin/clock_app/vm_install_dependencies_and_docker-compose.sh'

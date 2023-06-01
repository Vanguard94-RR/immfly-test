# Web Clock application

## How to use instruction

### Full auto deployment

In order to deploy the application in auto mode use provided script:

    $ bash app_auto_deployment.sh

    or

    $ ./app_auto_deployment.sh

Run those commands from within the VM-Setup folder

### Independent operations

The automation is designed to apply VM configuration and deploy the application in one move, but can be
used independently to configure de vm, in order to deploy the application the vm *must* be configured.

#### Configure only local and VM

To configure local machine and VM use:

    $ sudo ansible-playbook configure_local_and_vm.yml

To deploy the application use:

    $ sudo ansible-playbook -i hosts.ini deploy_clock_app.yml

Run those commands from within the VM-Setup folder

The application will be available in http://192.168.122.188:80

Or you can manually ssh in to the vm as "admin" with "asdf" and run $ sudo docker-compose up.


#!/bin/bash

# Create the necessary directories
mkdir -p roles/deploy_files_and_docker/tasks
mkdir -p roles/deploy_files_and_docker/templates
mkdir -p roles/deploy_files_and_docker/defaults
mkdir -p files_deploy

# Create the task files
touch roles/deploy_files_and_docker/tasks/main.yml
cat <<EOF >roles/deploy_files_and_docker/tasks/main.yml
- include_tasks: list_files.yml
- include_tasks: copy_files.yml
- include_tasks: build_containers.yml
EOF

touch roles/deploy_files_and_docker/tasks/list_files.yml
cat <<EOF >roles/deploy_files_and_docker/tasks/list_files.yml
- name: List files in local directory
  find:
    paths: /home/mint/Documents/immfly-test/VM-Setup/files_deploy/
    file_type: file
  register: files_to_deploy

EOF

touch roles/deploy_files_and_docker/tasks/copy_files.yml
cat <<EOF >roles/deploy_files_and_docker/tasks/copy_files.yml
- name: Copy files Frontend files to remote host
  copy:
    src: /home/mint/Documents/immfly-test/VM-Setup/frontend/
    dest: /home/admin/clock_app/

- name: Copy files Backend files to remote host
  copy:
    src: /home/mint/Documents/immfly-test/VM-Setup/backend/
    dest: /home/admin/clock_app/

- name: Copy files Docker files to remote host
  copy:
    src: /home/mint/Documents/immfly-test/VM-Setup/docker/
    dest: /home/admin/clock_app/

EOF

touch roles/deploy_files_and_docker/tasks/build_containers.yml
cat <<EOF >roles/deploy_files_and_docker/tasks/build_containers.yml
- name: Build backend and frontend containers
  shell: sudo docker-compose up --build
  async: 3600
  poll: 0

- name: test docker-compose
  docker_compose:
    project_src: /home/admin/clock_app/
    state: present

EOF

# Create the template file
sudo cp /home/mint/Documents/immfly-test/VM-Setup/docker/docker-compose.yml /home/mint/Documents/immfly-test/VM-Setup/roles/deploy_files_and_docker/templates/docker-compose.yml.j2

# Create the defaults file
touch roles/deploy_files_and_docker/defaults/main.yml
cat <<EOF >roles/deploy_files_and_docker/defaults/main.yml
# Default variables for the deploy_files_and_docker role

# Define the local directory containing files to deploy
local_directory: "{{ ansible_env.PWD }}/files_deploy"

# Define the destination path on the remote host
remote_directory: /home/admin/clock_app/
EOF

# Change permisions to file and folder structure

# chmod -R a+rwx,u-x,g-x,o-wx "$(pwd)/roles"

# Print success message
echo "Folder structure created successfully!"

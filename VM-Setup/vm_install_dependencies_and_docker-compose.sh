#! /bin/bash

sudo apt-get update && apt-get upgrade

sudo apt-get passwd install ca-certificates curl gnupg docker-compose python3-pip npm -y

sudo npm init -y

sudo npm install express

sudo pip3 install Flask

#curl -fsSL https://get.docker.com -o get-docker.sh

#sudo sh get-docker.sh

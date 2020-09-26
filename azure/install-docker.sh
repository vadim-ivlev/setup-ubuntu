#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

# docker
sudo apt install docker.io 
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
docker -v

# docker post install. running without sudo.
# Create the docker group.
sudo groupadd docker
# Add your user to the docker group.
sudo usermod -aG docker $USER

pwd

# add to swarm as worker



# git clone text-processor
git clone https://github.com/vadim-ivlev/text-processor.git
# start text processor
cd text-processor/deploy
docker-compose -f docker-compose-worker.yml up -d


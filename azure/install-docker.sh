#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

# docker
sudo apt-get install -y fish mc docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
docker -v

# docker post install. running without sudo.
# Create the docker group.
sudo groupadd docker
# Add your user to the docker group.
sudo usermod -aG docker $USER

# Install docker-compose
# 1. Run this command to download the current stable release of Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# 2. Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose



# add to swarm as worker



# git clone text-processor
git clone https://github.com/vadim-ivlev/text-processor.git
# start text processor
cd text-processor/deploy
docker-compose -f docker-compose-worker.yml up -d
# docker logs -f text-processor-worker




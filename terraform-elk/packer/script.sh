#!/bin/bash

cd docker_elk/
sudo yum update -y
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo pip3 install -U docker-compose
sudo chmod -R 777 /var/run/docker.sock
docker-compose up -d
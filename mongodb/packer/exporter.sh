#!/bin/bash

sudo yum install docker -y

sudo systemctl enable docker
sudo systemctl start docker

sudo docker pull bitnami/mongodb-exporter:latest

sudo docker run -d \
-p 9216:9216 \
--name mongodb-exporter \
-e "MONGODB_URI=mongodb://root:root@localhost:27017" \
bitnami/mongodb-exporter
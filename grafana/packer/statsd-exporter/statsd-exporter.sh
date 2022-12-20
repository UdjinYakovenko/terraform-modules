#!/bin/bash

sudo yum install docker -y

sudo systemctl enable docker
sudo systemctl start docker

sudo docker pull prom/statsd-exporter

cd /tmp/
pwd
sudo docker run -d --restart unless-stopped -p 9102:9102 -p 9125:9125 -p 9125:9125/udp \
        -v $PWD/mapping.yml:/tmp/mapping.yml \
        prom/statsd-exporter --statsd.mapping-config=/tmp/mapping.yml
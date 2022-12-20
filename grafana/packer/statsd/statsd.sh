#!/bin/bash

sudo amazon-linux-extras install epel -y
sudo yum update -y

sudo yum install nodejs npm -y
sudo yum install statsd -y

sudo systemctl enable statsd.service
sudo systemctl start statsd.service
sudo systemctl status statsd.service

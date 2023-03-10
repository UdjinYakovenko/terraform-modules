#!/bin/bash

sudo yum update -y

sudo cp /tmp/mongod.conf /etc/

sudo tee /etc/yum.repos.d/mongodb-org-5.0.repo<<EOL
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc
EOL

sudo yum repolist
sudo yum install mongodb-org -y

sudo systemctl start mongod.service
sudo systemctl enable mongod.service
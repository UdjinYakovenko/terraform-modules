#!/bin/bash

# Grafana

sudo yum install -y https://dl.grafana.com/oss/release/grafana-8.0.6-1.x86_64.rpm

sudo cp /tmp/grafana.ini /etc/grafana/grafana.ini

sudo systemctl daemon-reload
sudo systemctl enable grafana-server.service

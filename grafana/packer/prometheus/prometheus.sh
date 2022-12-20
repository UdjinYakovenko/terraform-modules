#!/bin/bash -e

sudo yum update -y
sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

wget https://github.com/prometheus/prometheus/releases/download/v2.29.1/prometheus-2.29.1.linux-amd64.tar.gz
tar xvfz prometheus-2.29.1.linux-amd64.tar.gz

sudo cp prometheus-2.29.1.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.29.1.linux-amd64/promtool /usr/local/bin/
sudo cp -r prometheus-2.29.1.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.29.1.linux-amd64/console_libraries /etc/prometheus

sudo cp prometheus-2.29.1.linux-amd64/promtool /usr/local/bin/
rm -rf prometheus-2.29.1.linux-amd64.tar.gz prometheus-2.29.1.linux-amd64

sudo tee -a /etc/systemd/system/prometheus.service << END
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target
[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
  --config.file /etc/prometheus/prometheus.yml \
  --storage.tsdb.path /var/lib/prometheus/ \
  --web.console.templates=/var/lib/prometheus/consoles \
 --web.console.libraries=/var/lib/prometheus/console_libraries
[Install]
WantedBy=multi-user.target
END

sudo cp /tmp/prometheus.yml /etc/prometheus/prometheus.yml

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

sudo systemctl daemon-reload
sudo systemctl enable prometheus
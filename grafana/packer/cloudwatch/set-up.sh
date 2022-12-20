#!/bin/bash

sudo docker pull prom/cloudwatch-exporter

sudo docker run -d --restart unless-stopped -p 9106:9106 -e AWS_ACCES_KEY_ID=AKIAQM2SOKYGEHJFW7SD -e AWS_SECRET_ACCESS_KEY=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 -v /tmp/config.yml:/config/config.yml prom/cloudwatch-exporter

sudo docker run -d --restart unless-stopped -p 9106:9106 -v /tmp/credentials:/exporter/ .aws/credential -v /tmp/config.yml:/config/config.yml prom/cloudwatch-exporter
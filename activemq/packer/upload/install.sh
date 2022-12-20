#!/bin/bash
set -e

yum install java-1.8.0-openjdk -y



cp /opt/upload/init_instance.service /etc/systemd/system/
cp /opt/upload/init_instance.sh /opt/init_instance.sh
chmod +x /opt/init_instance.sh
systemctl enable init_instance.service



tar xzvf /opt/upload/apache-activemq-5.16.3-bin.tar.gz -C /opt/
ln -sv /opt/apache-activemq-5.16.3 /opt/activemq
cp /opt/upload/activemq.service /etc/systemd/system/
cp /opt/upload/activemq.xml /opt/activemq/conf/
cp /opt/upload/activemq.env /opt/activemq/bin/env
cp /opt/upload/activemq.jetty.xml /opt/activemq/conf/jetty.xml
cp /opt/upload/activemq.jolokia.xml /opt/activemq/webapps/api/WEB-INF/classes/jolokia-access.xml
adduser --system --no-create-home activemq
usermod -a -G activemq ec2-user
chown activemq:activemq /opt/activemq
chown -R activemq:activemq /opt/activemq/*
systemctl enable activemq.service



amazon-linux-extras install collectd -y
yum install collectd-java.x86_64 -y
yum install collectd-generic-jmx.x86_64 -y
yum install collectd-write_prometheus.x86_64 -y
cp /opt/upload/collectd.conf /etc/collectd.d/
ln -s /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.302.b08-0.amzn2.0.1.x86_64/jre/lib/amd64/server/libjvm.so /lib64/libjvm.so
systemctl enable collectd.service

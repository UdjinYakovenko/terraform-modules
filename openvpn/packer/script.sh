#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker

sudo chmod -R 777 /var/run/docker.sock

mkdir vpn-data && touch vpn-data/vars

sudo docker pull kylemanna/openvpn

# sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://IP_ADDRESS:1194
# sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
# sudo docker run -v $PWD/vpn-data:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn

# sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full udjin nopass
# sudo docker run -v $PWD/vpn-data:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient udjin > udjin.ovpn
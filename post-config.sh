#!/usr/bin/env bash

function log {
	echo -e "[INFO] $1"
}

function logerr {
	echo -e "[ERRO] $1"
}

log "Start post-config script"

log "Install gtp5g kernel module"
cd /tmp \
    && git clone https://github.com/PrinzOwO/gtp5g.git \
    && cd gtp5g \
    && make clean \
    && make \
    && make install

log "gtp5g kernel module is located here:"
find /lib/modules/$(uname -r) -type f -name gtp5g*

log "Installing free5gs"

sudo apt-get update
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:open5gs/latest -y
sudo apt-get update
sudo apt-get install open5gs -y

log "installing free5gs WEBUI"
sudo apt-get update
sudo apt-get install curl -y
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs -y

curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -

log "Setting up the NAT"
sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv6.conf.all.forwarding=1

sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE
sudo ip6tables -t nat -A POSTROUTING -s 2001:230:cafe::/48 ! -o ogstun -j MASQUERADE

log "disabling firewall"
sudo ufw disable


log "End post-config script"


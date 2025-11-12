#!/bin/bash

bash initial.sh

# setting SERVER_PRIVATE_KEY
key=$(cat /etc/wireguard/private.key)
sed -i "s|SERVER_PRIVATE_KEY|$key|" server.conf

# setting CLIENT_PUBLIC_KEY
read -p "Client Public Key: " PUBLIC_KEY
sed -i "s|CLIENT_PUBLIC_KEY|$PUBLIC_KEY|" server.conf

cp server.conf /etc/wireguard/wg0.conf

# setting forward rules for IPv4 and IPv6
echo "net.ipv4.ip_forward=1" | tee -a /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding=1" | tee -a /etc/sysctl.conf

sysctl -p

clear
ip -4 addr show enp0s3 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

echo ""
echo "Configuration updated."
read -p "Press [Enter] to start WireGuard and finalize the setup..."

bash enable.sh

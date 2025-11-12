#!/bin/bash

bash initial.sh

# setting CLIENT_PRIVATE_KEY
key=$(cat /etc/wireguard/private.key)
sed -i "s|CLIENT_PRIVATE_KEY|$key|" client.conf

# setting SERVER_PUBLIC_KEY
read -p "Server Public Key: " PUBLIC_KEY
sed -i "s|SERVER_PUBLIC_KEY|$PUBLIC_KEY|" client.conf
clear

# setting SERVER_PUBLIC_IP
read -p "Server Public IP Address: " SERVER_IP
sed -i "s|SERVER_PUBLIC_IP|$SERVER_IP|" client.conf

cp client.conf /etc/wireguard/wg0.conf

echo ""
echo "Configuration updated."
read -p "Press [Enter] to start WireGuard and finalize the setup..."

bash enable.sh

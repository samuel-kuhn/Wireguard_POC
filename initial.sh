#!/bin/bash

apt update
apt upgrade -y

apt install wireguard -y

wg genkey | tee /etc/wireguard/private.key
chmod go= /etc/wireguard/private.key

cat /etc/wireguard/private.key | wg pubkey | tee /etc/wireguard/public.key

clear
echo "Public Key:"
cat /etc/wireguard/public.key

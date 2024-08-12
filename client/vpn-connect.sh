#!/usr/bin/env bash

echo "Connecting to Sineware SSLVPN Server Endpoint..."

VPN_CIDR="0.0.0.0/0"
VPN_IP="localhost"
VPN_PORT="443"

sshuttle -r vpn@sslvpn $VPN_CIDR -e "ssh -o ProxyCommand='openssl s_client -connect $VPN_IP:$VPN_PORT -quiet'"
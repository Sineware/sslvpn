#!/usr/bin/env bash

echo "--- Starting Sineware SSLVPN ---"
uname -a
echo "Authorized Keys: $SSLVPN_AUTHORIZED_KEYS"

# Check for authorized keys
if [ -z "$SSLVPN_AUTHORIZED_KEYS" ]; then
    echo "No authorized keys found. Exiting..."
    exit 1
fi

# Create authorized_keys file
echo "$SSLVPN_AUTHORIZED_KEYS" > /home/vpn/.ssh/authorized_keys
echo "--- Starting SSHD ---"

exec /usr/sbin/sshd -D
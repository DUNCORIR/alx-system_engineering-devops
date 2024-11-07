#!/usr/bin/env bash
# Script to clean up /etc/hosts and restore default settings.

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root with sudo."
    exit 1
fi

# Remove duplicates and specific entries
sed -i '/127.0.0.2 mylocalhost/d' /etc/hosts
sed -i '/8.8.8.8 facebook.com/d' /etc/hosts

# Ensure localhost points to 127.0.0.1
if ! grep -q '^127.0.0.1 localhost' /etc/hosts; then
    echo "127.0.0.1 localhost" | tee -a /etc/hosts
fi

echo "Cleanup complete. /etc/hosts has been reset to default."


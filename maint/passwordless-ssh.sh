#!/bin/bash

# Define the source server IP
SOURCE_SERVER="10.101.199.21"

# Define the target server range (IPs)
TARGET_SERVERS=("10.101.199.22" "10.101.199.23" "10.101.199.24" "10.101.199.25")

# SSH port
SSH_PORT=1895

# Path to the SSH public key
PUBLIC_KEY_PATH="$HOME/.ssh/id_rsa.pub"

# Ensure the source server has the SSH key
if [ ! -f "$PUBLIC_KEY_PATH" ]; then
    echo "SSH public key not found. Please generate an SSH key first."
    exit 1
fi

# Loop over all target servers
for SERVER in "${TARGET_SERVERS[@]}"; do
    echo "Copying SSH key to $SERVER on port $SSH_PORT..."

    # Copy the public key to the target server
    ssh-copy-id -i "$PUBLIC_KEY_PATH" -p $SSH_PORT "root@$SERVER"

    if [ $? -eq 0 ]; then
        echo "SSH key copied successfully to $SERVER"
    else
        echo "Failed to copy SSH key to $SERVER"
    fi
done

echo "Password-less SSH setup completed for all target servers."


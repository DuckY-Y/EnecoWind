#!/bin/bash

source "config_cron.sh"

SSH_KEY="$HOME/.ssh/id_ed25519"

if [ ! -f "$SSH_KEY" ]; then
    ssh-keygen -t ed25519 -f "$SSH_KEY" -N ''
fi

ssh-copy-id -i "$SSH_KEY.pub" "$REMOTE_MACHINE"
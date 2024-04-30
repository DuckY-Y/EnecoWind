#!/bin/bash

source "./config_cron.sh"

scp "$REMOTE_MACHINE":"$SOURCE_DIR"/* "$DEST_DIR"/

if [ $? -eq 0 ]; then
    echo "Files copied successfully."
else
    echo "Error: Failed to copy files."
fi

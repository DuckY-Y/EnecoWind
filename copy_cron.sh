#!/bin/bash
source "./config_cron.sh"
scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_ps "$DEST_DIR"/
scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_sb "$DEST_DIR"/
if [ $? -eq 0 ]; then
    echo "Directories copied successfully."
else
    echo "Error: Failed to copy directories."
fi
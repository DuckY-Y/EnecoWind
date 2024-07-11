#!/bin/bash'

source "./config_cron.sh"

scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_ps "$DEST_DIR"/
scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_sb "$DEST_DIR"/
if [ $? -eq 0 ]; then
    echo "Directories copied successfully."
    if [ "$DELETE_FILES" = "true" ]; then
        ssh "$REMOTE_MACHINE" "rm -r \"$TARGET_DIR\"/loggingdatawing_ps \"$TARGET_DIR\"/loggingdatawing_sb"
        if [ $? -eq 0 ]; then
            echo "Directories deleted successfully on the target machine."
        else
            echo "Error: Failed to delete directories on the target machine."
        fi
    fi
else
    echo "Error: Failed to copy directories."
fi
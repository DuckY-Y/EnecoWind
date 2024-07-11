#!/bin/bash'

source "$PWD/config_cron.sh" # present working directory for some reason is missing the last folder

echo "Remote machine: $REMOTE_MACHINE"
echo "Target directory: $TARGET_DIR"
echo "Destination directory: $DEST_DIR"

scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_aft "$DEST_DIR"/
scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_fwd "$DEST_DIR"/
if [ $? -eq 0 ]; then
    echo "Directories copied successfully."
    if [ "$DELETE_FILES" = "true" ]; then
        ssh "$REMOTE_MACHINE" "rm -r \"$TARGET_DIR\"/loggingdatawing_aft \"$TARGET_DIR\"/loggingdatawing_fwd"
        if [ $? -eq 0 ]; then
            echo "Directories deleted successfully on the target machine."
        else
            echo "Error: Failed to delete directories on the target machine."
        fi
    fi
else
    echo "Error: Failed to copy directories."
fi

#!/bin/bash

source "$PWD/config_cron.sh"

scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_aft "$DEST_DIR"/
scp -r "$REMOTE_MACHINE":"$TARGET_DIR"/loggingdatawing_fwd "$DEST_DIR"/
if [ $? -eq 0 ]; then
    echo "Directories copied successfully."
    if [ "$DELETE_FILES" = "true" ]; then
        ssh "$REMOTE_MACHINE" "rm -r \"$TARGET_DIR\"/loggingdatawing_aft \"$TARGET_DIR\"/loggingdatawing_fwd"
        if [ $? -eq 0 ]; then
            echo "Directories deleted successfully on the target machine."
        else
            echo "Error: Failed to delete directories on the target machine."
        fi
    fi
else
    echo "Error: Failed to copy directories."
fi
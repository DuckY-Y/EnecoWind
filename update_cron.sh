#!/bin/bash

source "$PWD/config_cron.sh"

update_cron_job() {
    UPDATE_FILE="copy_cron.sh"
    if [ -f "$UPDATE_FILE" ]; then
        # Set the cron job to run at the time specified in the configuration
        NEW_CRON_JOB="$CRON_TIME bash $PWD/$UPDATE_FILE >> $PWD/copy_cron.log 2>&1"
        (crontab -l ; echo "$NEW_CRON_JOB") | crontab -
        
        if [ $? -eq 0 ]; then
            echo "Cron job updated successfully."
        else
            echo "Error: Failed to update cron job."
        fi
    else
        echo "Error: Update file not found."
    fi
}
update_cron_job
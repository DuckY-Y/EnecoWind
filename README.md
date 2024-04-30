# Cron Job Configuration Scripts

This repository contains scripts for configuring and managing cron jobs.

## Files

### [config_cron.sh](config_cron.sh)

This script sets up the configuration variables for the cron jobs. It defines the source directory (`SOURCE_DIR`), the destination directory (`DEST_DIR`), the remote machine (`REMOTE_MACHINE`), and the time at which the cron job should run (`CRON_TIME`).

### [copy_cron.sh](copy_cron.sh)

This script is responsible for copying the logs from the `SOURCE_DIR` to the `DEST_DIR`. It should be run as a cron job at the frequency set in `CRON_TIME`.

### [update_cron.sh](update_cron.sh)

This script updates the cron jobs according to the configuration set in `config_cron.sh`. It should be run whenever there are changes to the configuration.

### [setup_ssh.sh](setup_ssh.sh)

This script sets up SSH access to the remote machine. It creates an ed25519 SSH key if it doesn't already exist and copies the public key to the `authorized_keys` file on the remote machine. It uses the `REMOTE_MACHINE` variable from the `config_cron.sh` file.


## Usage

1. Set up the configuration variables in `config_cron.sh`.
2. If not already done: Run `setup_ssh.sh` to set up SSH access to the remote machine.
3. Run `update_cron.sh` to update the cron jobs.
4. The `copy_cron.sh` script will run at the frequency set in the cron jobs, copying the logs from the source to the destination directory.


*Please ensure that you have the necessary permissions to run these scripts and access the directories and remote machine specified in the configuration.*
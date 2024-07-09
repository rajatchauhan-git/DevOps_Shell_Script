#!/bin/bash


<<readme
this script takes backup of directory
usage:
./backup.sh <path of directory>
readme


source_dir="$1"
target_dir="$2"

timestamp=$(date '+%y-%m-%d_%H-%M-%S')

backup_dir="${target_dir}/backup_${timestamp}.zip"

function create_backup {
    # Create the backup
    zip -r "${backup_dir}" "${source_dir}" > /dev/null

    if [ $? -eq 0 ]; then
        echo "Backup created successfully"
    else
        echo "Backup was not performed for $timestamp"
    fi
}

function perform_rotation {
    # List backups, sorted by modification time, newest first
    backups=($(ls -t "${target_dir}/backup"*.zip))

    if [ "${#backups[@]}" -gt 5 ]; then
        backups_to_remove=("${backups[@]:5}")
        for backup in "${backups_to_remove[@]}"; do
            rm -f -- "$backup"
            if [ $? -eq 0 ]; then
                echo "Removed old backup: $backup"
            else
                echo "Failed to remove old backup: $backup"
            fi
        done
    fi
}

create_backup
perform_rotation


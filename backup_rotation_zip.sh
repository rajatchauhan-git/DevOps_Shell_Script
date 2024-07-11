#!/bin/bash

# Ask user for the directory path to backup
read -p "Enter the directory path to backup: " SOURCE_DIR

# Check if directory path is provided
if [ -z "$SOURCE_DIR" ]; then
    echo "Error: Source directory path not provided."
    exit 1
fi

# Check if the provided path is a directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: $SOURCE_DIR is not a directory."
    exit 1
fi

# Ask user for the directory path to save the backup
read -p "Enter the directory path to save the backup: " BACKUP_DIR

# Check if backup directory path is provided
if [ -z "$BACKUP_DIR" ]; then
    echo "Error: Backup directory path not provided."
    exit 1
fi

# Get the current timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup zip file name with the timestamp
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.zip"

# Create the backup folder if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Zip the source directory into the backup zip file
zip -r "$BACKUP_FILE" "$SOURCE_DIR"

# Print a message indicating the backup has been created
echo "Backup created: $BACKUP_FILE"

# Find and remove the oldest backups if there are more than 3
BACKUP_COUNT=$(ls -d "$BACKUP_DIR"/backup_*.zip | wc -l)
if [ "$BACKUP_COUNT" -gt 3 ]; then
    # Get the list of backups sorted by creation time and remove the oldest ones
    ls -dt "$BACKUP_DIR"/backup_*.zip | tail -n +4 | xargs rm -rf
fi

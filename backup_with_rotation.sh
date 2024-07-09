#!/bin/bash

# Check if directory path is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Get the directory path from the first argument
DIR_PATH=$1

# Check if the provided path is a directory
if [ ! -d "$DIR_PATH" ]; then
    echo "Error: $DIR_PATH is not a directory."
    exit 1
fi

# Get the current timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Create the backup folder name with the timestamp
BACKUP_FOLDER="$DIR_PATH/backup_$TIMESTAMP"

# Create the backup folder
mkdir -p "$BACKUP_FOLDER"

# Copy all files from the specified directory to the backup folder
cp -r "$DIR_PATH"/* "$BACKUP_FOLDER"

# Print a message indicating the backup has been created
echo "Backup created: $BACKUP_FOLDER"

# Find and remove the oldest backups if there are more than 3
BACKUP_COUNT=$(ls -d "$DIR_PATH"/backup_* | wc -l)
if [ "$BACKUP_COUNT" -gt 3 ]; then
    # Get the list of backups sorted by creation time and remove the oldest ones
    ls -dt "$DIR_PATH"/backup_* | tail -n +4 | xargs rm -rf
fi

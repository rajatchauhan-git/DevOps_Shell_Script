#!/bin/bash
# Script to rename files with a specific extension to a prefix with sequential numbers

# Variables
directory="."  # Current directory
prefix="file"  # Prefix for the renamed files
extension=".txt"  # File extension to look for

# Check if any files with the given extension exist
count=1
for file in "$directory"/*"$extension"; do
  if [ -f "$file" ]; then
    # Rename the file with a sequential number
    new_name="${prefix}${count}${extension}"
    mv "$file" "$new_name"
    echo "Renamed $file to $new_name"
    count=$((count + 1))
  else
    echo "No files with extension $extension found."
    exit 1
  fi
done
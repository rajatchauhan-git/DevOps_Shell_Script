#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if the file exists and is readable
if [ ! -r "$filename" ]; then
    echo "Error: File $filename not found or not readable."
    exit 1
fi

# Read each filename from the provided text file
while IFS= read -r file; do
    # Check if the file exists
    if [ -e "$file" ]; then
        # Get the size of the file
        size=$(stat --printf="%s" "$file" 2>/dev/null)
        if [ $? -eq 0 ]; then
            echo "File: $file, Size: $size bytes"
        else
            echo "Error: Could not retrieve size for file $file"
        fi
    else
        echo "File $file not found"
    fi
done < "$filename"

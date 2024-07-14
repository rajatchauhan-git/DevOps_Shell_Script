#!/bin/bash

# Ensure the user provides a filename as an argument
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

# Use awk to count occurrences of each word and sort by frequency
awk '
{
    for (i = 1; i <= NF; i++) {
        words[$i]++;
    }
}
END {
    for (word in words) {
        print words[word], word;
    }
}
' "$filename" | sort -nr

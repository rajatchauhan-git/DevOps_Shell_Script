#!/bin/bash

# Check if a filename was provided
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 filename"
    exit 1
fi

filename=$1

# Check if the file exists
if [[ ! -f $filename ]]; then
    echo "File not found!"
    exit 1
fi

# Count lines, words, and characters
lines=$(wc -l < "$filename")
words=$(wc -w < "$filename")
chars=$(wc -m < "$filename")

echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"
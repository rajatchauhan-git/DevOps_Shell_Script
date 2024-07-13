#!/bin/bash

my_directory=$1

mkdir $1

if [ $? -ne 0 ]; then
  echo "Error: Failed to create directory "$1"."
  exit 1
fi

echo "Directory "$1" created successfully."


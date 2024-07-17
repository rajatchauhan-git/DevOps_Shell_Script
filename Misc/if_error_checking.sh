#!/bin/bash

my_directory=$1
my_file=$2

mkdir $1

if [ $? -ne 0 ]; then
  echo "Error: Failed to create directory "$1"."
  exit 1
fi

echo "Directory "$1" created successfully."

touch "$1"/"$2".txt

if [ $? -ne 0 ]; then
  echo "Error: Failed to create file "$2" inside "$1"."
  exit 1
fi

echo "File "$1" created successfully in "$1"."

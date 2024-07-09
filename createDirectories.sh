#!/bin/bash

#Assing Arguments

dir_name=$1
start_number=$2
end_number=$3

#Create Directories

for (( i=start_number; i<=end_number; i++ ))
do
	mkdir -p "${dir_name}${i}"
done

echo "Directories created from ${dir_name}${start_number} to ${dir_name}${end_number}"

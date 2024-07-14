#!/bin/bash

#- Write a script that uses a loop to print numbers from 1 to 5.

echo "Number from 1 to 5"
for i in {1..5}; do
	echo $i
done

echo "-------------------------"

#- Expand it to print numbers from 1 to a number entered by the user.

echo "Task 2: Enter a number to print numbers from 1 to that number:"
read max_number

if [[ ! $max_number =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

echo "Numbers from 1 to $max_number:"
for (( i=1; i<=$max_number; i++ )); do
    echo $i
done

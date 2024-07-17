#!/bin/bash

#- Write a script that checks if a file exists in the current directory. If it does, print a message confirming its existence; otherwise, print an error message.

echo "please enter the filename: "
read filename

if [ -e "$filename" ]; then
	echo "The file '$filename' exists in the current durectory"
else
	echo "Error: The file '$filename' doe not exsist in the current directory"
fi

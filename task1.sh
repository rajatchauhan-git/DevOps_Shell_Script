#!/bin/bash

# *Hello World Script*: Create a script that simply prints "Hello, World!" to the terminal.

echo "Hello World"

# Create a script that asks the user for their name and then prints a greeting using that name.
#   - Use variables to store the user's input and the greeting message.

echo "Please enter your name:"
read user_name


greeting="Hello, $user_name! How are you?"

echo $greeting

#- Write a script that checks if a file exists in the current directory. If it does, print a message confirming its existence; otherwise, print an error message.

echo "please enter the filename: "
read filename

if [ -e "$filename" ]; then
	echo "The file '$filename' exists in the current durectory"
else
	echo "Error: The file '$filename' doe not exsist in the current directory"
fi





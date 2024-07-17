#!/bin/bash

# Create a script that asks the user for their name and then prints a greeting using that name.
#  Use variables to store the user's input and the greeting message.

echo "Please enter your name:"
read user_name


greeting="Hello, $user_name! How are you?"

echo $greeting


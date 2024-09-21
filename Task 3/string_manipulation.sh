#!/bin/bash
# Script to check if a given string is a palindrome

# Prompt the user for a string
read -p "Enter a string: " input_string

# Remove spaces and convert the string to lowercase to handle multi-word and case-sensitive palindromes
clean_string=$(echo "$input_string" | tr -d ' ' | tr '[:upper:]' '[:lower:]')

# Reverse the string
reversed_string=$(echo "$clean_string" | rev)

# Check if the original string is the same as the reversed string
if [ "$clean_string" == "$reversed_string" ]; then
  echo "The string '$input_string' is a palindrome."
else
  echo "The string '$input_string' is not a palindrome."
fi

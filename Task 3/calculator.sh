#!/bin/bash
# A simple calculator script

# Prompt the user for two numbers and an operator
read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter an operator (+, -, *, /): " operator

# Perform the arithmetic operation based on the user's input
case $operator in
  "+")
    result=$(echo "$num1 + $num2" | bc)  # Addition
    ;;
  "-")
    result=$(echo "$num1 - $num2" | bc)  # Subtraction
    ;;
  "*")
    result=$(echo "$num1 * $num2" | bc)  # Multiplication
    ;;
  "/")
    # Ensure no division by zero
    if [ "$num2" -eq 0 ]; then
      echo "Error: Division by zero is not allowed."
      exit 1
    fi
    result=$(echo "scale=2; $num1 / $num2" | bc)  # Division (up to 2 decimal places)
    ;;
  *)
    echo "Invalid operator. Use +, -, *, or /."
    exit 1
    ;;
esac

# Output the result
echo "Result: $result"
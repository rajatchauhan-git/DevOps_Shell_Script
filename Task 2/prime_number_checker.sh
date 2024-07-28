#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [[ $num -lt 2 ]]; then
        echo 0
        return
    fi

    for ((i=2; i*i <= num; i++)); do
        if ((num % i == 0)); then
            echo 0
            return
        fi
    done

    echo 1
}

# Find and print all prime numbers between 1 and 100
for ((n=1; n<=100; n++)); do
    if [[ $(is_prime $n) -eq 1 ]]; then
        echo $n
    fi
done
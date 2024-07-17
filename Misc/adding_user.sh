#!/bin/bash

add_user()
{
USER=$1
PASS=$2

useradd -m -p $PASS $USER && echo "User added"

}

#MAIN

add_user jerry1 test@123

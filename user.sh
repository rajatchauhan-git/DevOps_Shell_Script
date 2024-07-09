#!/bin/bash

#function defined
function create_user {

	read -p "Enter Username: " username

        read -p "Enter Password: " password

	sudo useradd -m $username -p $password

	echo " User $username created"
}

for(( i=1; i<=2; i++ ))
do

	create_user #function calling
done






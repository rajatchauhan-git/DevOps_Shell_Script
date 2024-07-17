#!/bin/bash

#function defined
function del_user {

	read -p "Enter Username: " username

        #read -p "Enter Password: " password

	sudo deluser -r $username

	echo " User $username deleted"
}

for(( i=1; i<=2; i++ ))
do

	del_user #function calling
done






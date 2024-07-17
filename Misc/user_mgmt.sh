#!/bin/bash

#function to create user defined

function create_user {

	read -p "Enter Username: " username

        #read -p "Enter Password: " password

	sudo useradd -m $username

	echo " User $username created"
}

#function to del user defined

function del_user {

        read -p "Enter Username: " username

        #read -p "Enter Password: " password

        sudo deluser -r $username

        echo " User $username deleted"
}

create_user

del_user

case "$1" in
	c)
		echo "User creation in progress"
		create_user
		;;
	d)
		echo "User Deletion in progress"
		del_user
		;;


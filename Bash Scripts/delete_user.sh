#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Delete User Account
############

# Verify there is a username parameter
if  [ "$1" > 1 ]
then 
	echo "Checking User Account $1 ..."
else
	echo "Error: No username specified"
	exit
fi
delete_homedir=0
# Verify the user account exists
usr_check=`getent passwd $1`
if [ $usr_check > 0 ]; then
	echo "$1: user account found"
	# check for home directory
	h=`ls /home/$1`
	echo $h
	if [[ ${#h} -gt 0 ]]; then
		echo "PASS: $h" # Included for debug
		echo "found $1 home directory: will delete /home/$1"
		delete_homedir=1
	else:
		echo "FAIL: Looks like home directory was a no go: $h"
	fi
else
	echo "Error: No user named $1 found"
	exit
fi

read -p "Delete User: $1? (y/n) " r
if [[ "$r" =~ ^n ]]
then
	echo "Not deleting $1"
	exit
elif [[ "$r" =~ ^y ]] # if user response starts with a 'y'
then	# Delete user account home directory
	echo "running userdel $1" # included for interactive UI
	del_user=`userdel $1`
	echo "$del_user" # included for debug
	if [ $delete_homedir -gt 0 ]
	then
		echo "running sudo rm -Rd /home/$1" # included for debug
		`sudo rm -Rd /home/$1`
	else
		echo "Home directory not found, no home directory deleted"
	fi
else
	echo "$response not recognized, quitting."
	exit
fi

# display the result of tail /etc/passwd
#
echo "Confirming last line of passwd file"
tail -n 1 /etc/passwd
echo "That's All Folks"
exit
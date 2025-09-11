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

# Verify the user account exists
usr_check=`getent passwd $1`
if [ $usr_check > 0 ]
then
	echo "$1: user account found"
	# check for home directory
	delete_homedir=0
	hd_check=`ls /home/$1`
	if [ $hd_check -gt 0 ]
	then
		echo "found $1 home directory: will delete /home/$1"
		$delete_homedir=1
	else:
		echo "looks like $hd_check was a no go"
	fi
# create "dev_group if not"
else
	echo "Error: No user named $1 found"
	exit
fi

# Delete user account home directory
uconf=0
read -p "Delete User: $1? (y/n)" response
if [[ "$reponse" ~= "n" ]]
then
	echo "Not deleting $1"
	exit
elif [[ "$response" ~= "y" ]]
then
# 	userdel=`sudo userdel $1`
	echo "sudo userdel $1"
	echo "$userdel"
	if [ $delete_homedir -ge 0 ]
	then
# 		`sudo rm -Rd /home/$1`
		echo "sudo rm -Rd /home/$1"
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
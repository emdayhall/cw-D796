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
	if [[ ${#hd_check} -gt 0 ]]
	then
		echo "$hd_check" # Included for debug
		echo "found $1 home directory: will delete /home/$1"
		$delete_homedir=1
	else:
		echo "$hd_check"
		echo "looks like home directory $hd_check was a no go"
	fi
# create "dev_group if not"
else
	echo "Error: No user named $1 found"
	exit
fi

# Delete user account home directory
read -p "Delete User: $1? (y/n) " r
if [[ "$r" =~ ^n ]]
then
	echo "Not deleting $1"
	exit
elif [[ "$r" =~ ^y ]]
then
	echo "running userdel $1" # included for debug
	del_user=`userdel $1`
	echo "$del_user" # included for debug
	if [ $delete_homedir -ge 0 ]
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
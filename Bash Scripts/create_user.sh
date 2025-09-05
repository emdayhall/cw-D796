#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Create New User Account
############

# Verify there is a username parameter
if  [ "$1" > 1 ]
then 
	echo "Creating User Account: $1 "
else
	echo "Error: No user name specified"
	exit
fi

# check if user group "dev_group" exists

dg_check=`getent group dev_group`
if [ $dg_check > 0 ]
then
	echo "dev_group found"
# create "dev_group if not"
else
	dg_make=`sudo addgroup dev_group`
	echo $dg_make
fi
# add user
#
usr_check=`getent passwd $1`
if [ $usr_check > 0 ]
then
	echo "User $1 already exists"
	exit
else
	# Create user account
	`sudo useradd -g dev_group -m $1`
	# echo $usr_make
	`sudo passwd $1`
fi
# `adduser $1` #interact with UI to create password
# display the result of tail /etc/passwd
#
echo "Confirming last line of passwd file"
tail -n 1 /etc/passwd
echo "That's All Folks"

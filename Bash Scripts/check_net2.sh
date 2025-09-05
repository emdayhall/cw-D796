#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Check Network 2: Check Network with Ping DNS 8.8.8.8
############

dnsa="8.8.8.8"
# dnsa="GGrnnmxx.com" # Debug value
pingr=`ping -nc 10 $dnsa`

if [ ${#pingr} -le 0 ]
then
	echo -e "Failure: Ping failed to reach $uri"
	exit
else
	echo "Network Up"
fi
exit
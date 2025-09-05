#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Check Network 3: Check Network with NSLookup
############

token="server can't find" # failure key
uri="example.com"
# uri="GGrnnmxx.com" # Debug value

echo "Running..."
lupr=`nslookup $uri | grep "$token"`
if [ ${#lupr} -le 0 ]
then
	echo "Network Up"
	exit
else
	echo -e "Failure: nslookup failed to reach $uri"
fi
exit
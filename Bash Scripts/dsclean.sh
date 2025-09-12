#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Assess and Cleanup Diskspace
############

# Get the value of the available diskspace 
b=`df --output='avail' / | tail -n 1`
logdir="/tmp"
# Function to remove the contents of a directory recursively + log to /tmp/
cleanDir() { rm -rdv $1* &>> $logdir/dsclean.log; }

# If a directory to clean is not provided at the command line use test values
if [[ ! $1 ]]; then
	declare -a cleanup=("/test/a/" "/test/b/" "/test/c/")
else
	declare -a cleanup=($1)
	if [[ $1 =~ ^//tmp ]]; then logdir="/var"; fi
	echo "Logging to $logdir"
fi

# Loop through the cleanup array and execute cleanDir function for each entry
for i in "${cleanup[@]}"; do cleanDir $i; done 

# Get the value of the amount of free diskspace again
a=`df --output='avail' / | tail -n 1`
# Get the value of delta for available space after-before cleanDir
ds_delta=$((a - b))

# Message results to the command line depending on the value of delta in relation to 0
if [ $ds_delta -le 0 ]; then
	echo "No significant disk space was freed."
else
	echo "$ds_delta of space freed"
fi
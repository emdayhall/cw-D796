#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Assess and Cleanup Diskspace
############

# Find free diskspace 
free_ds=`df --output='avail'`
ds=$((${free_ds:8}))

# Start cleanDir() function
cleanDir() {
	echo "rm -rdv $1/*"	
}

cleanup=('/test/a/' '/test/b/' '/test/c/')

for i in "${cleanup[@]}"; do 
	echo $i;
	cleanDir($1) 
	done

free_ds2=`df --output='avail'`
ds2=$((${free_ds2}))

ds_delta=$(($ds-$ds2))

if [ $ds_delta -le 0 ];
then
	echo "No significant disk space was freed."
else
	echo "$ds_delta of space freed"
fi
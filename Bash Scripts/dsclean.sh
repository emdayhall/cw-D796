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
free_ds=`df --output='avail' / | tail -n 1`
# echo $free_ds

# Start cleanDir() function
cleanDir() { echo "rm -rdv $1/*"; rm -rdv $1*; }

declare -a cleanup=("/test/a/" "/test/b/" "/test/c/")

for i in "${cleanup[@]}"; do 
# 	echo $i;
 	cleanDir $i 
done

free_ds2=`df --output=avail / | tail -n 1`
# echo $free_ds2

ds_delta=$((free_ds2 - free_ds))
# echo $ds_delta
if [ $ds_delta -le 0 ]; then
	echo "No significant disk space was freed."
else
	echo "$ds_delta of space freed"
fi
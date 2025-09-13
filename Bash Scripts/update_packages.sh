#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Update Installed Packages
############

declare -a c=(yum dnf apt-get)
x=0
log2="/tmp/update.log"

# Determine which package handler is available
for cmd in "${c[@]}"; do
	i=$((x+1)); echo $i
	n=$(type -P "$cmd")
	if [[ n ]]; then
		unset $n
		break
	else
		unset $n
		x=$i
		continue
	fi
done

case "$x" in
	0)	echo "Using yum..."; yum update >> $log2
		;;
	1)	echo "Using dnf..."; dnf update >> $log2
		;;
	2)	echo "Using apt-get..."; apt-get -Uy upgrade >> $log2
		;;
esac
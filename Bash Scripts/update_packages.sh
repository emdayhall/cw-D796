#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Update Installed Packages
############

declare -a c=(yum dnf apt-get brew)
x=0

log2="/tmp/update.log"

# Determine which package handler is available
for cmd in "${c[@]}"; do 
	i=$((x+1));
	n=$(type -P "$cmd")
	if [[ ! $n ]]; then
# 		unset $n
# 		echo "n: $n is null for $cmd, check next"
		x=$i
 		continue
	else
# 		unset $n
# 		echo "n: $n for $cmd is not null"
		break
	fi
done

case "$x" in
	0)	echo "Using yum..."; yum update >> $log2
		;;
	1)	echo "Using dnf..."; dnf update >> $log2
		;;
	2)	echo "Using apt-get..."; apt-get -Uy upgrade >> $log2
		;;
	3) echo "Using brew..."; brew upgrade >> $log2
esac

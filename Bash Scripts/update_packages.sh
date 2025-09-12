#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Update Installed Packages
############

# Check which package handler is available
# cmd=ls
# [[ $(type -P "$cmd") ]] && echo "$cmd is in PATH"  || 
#     { echo "$cmd is NOT in PATH" 1>&2; exit 1; }

declare -a c=(yum dnf apt-get)
x=0
log2="/tmp/"
for cmd in "$c[][@]"; do
	i=$((x+1))
	x=$1
	n=$(type -P "$cmd")
	if [[ ! n ]]; then
		continue
	else
		break
	fi
done

case "$x" in
	0)	yum update >> /tmp/update.log
		;;
	1)	dnf update >> /tmp/update.log
		;;
	2)	apt-get update; apt-get upgrade >> /tmp/update.log
		;;
esac

more /tmp/update.log
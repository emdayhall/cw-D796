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
apt-get upgrade >> /tmp/update.log
more /tmp/upgrade.log

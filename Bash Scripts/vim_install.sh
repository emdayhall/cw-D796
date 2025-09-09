#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/05/2025
# Course: D796
# Install VI Improved if not already installed
# Upgrading/Updating the package is handled in 
# update_packages.sh 
############

vim_check=`apt-cache search 'VI Improved'`
if [${#vim_check} -gt 0]; then
	echo "Vim is already installed"
#	It might make sense to upgrade Vim here.
#	vinstall=`apt-get upgrade vim`
else
	vinstall=`apt-get install vim`
fi
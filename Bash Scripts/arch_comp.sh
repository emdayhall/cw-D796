#!/bin/bash 
############
# Emily Hall
# Student ID: 000262773
# MSCSCS
# Submission Date: 09/10/2025
# Course: D796
# Archive and Compress Script
############

# Implement fileSize() function

fileSize() {
	# argument is an existing fileSize
	validfile='ls -la $1'
	# file size of argument
	file_size=``
	# return fileSize 
	exit(file_size)
}
declare -a archives
# Archive and compress files and directories in /etc
# Using tar and gzip
archives[1]=`tar | gzip`
# Archive and compress the files and directories in /etc
# using tar and bzip2
archives[2]=`tar | bzip2` 
# Evaluate the file size of each compressed file using fileSize()
# for a in ${archives[@]}; do
# 	echo fileSize($a)
# done
if [ fileSize(archives[1]) -gt fileSize(archives[2])]; then
	echo "Gzip file is $((#archives[1]-#archives[2])) larger than BZip file";
else:
	echo "Bzip2 file is $((#archives[2]]-#archives[1])) larger than Gzip file";
fi
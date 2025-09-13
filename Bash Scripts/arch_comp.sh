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
	return $file_size
}

# Archive and compress files and directories in /etc
# Using tar and gzip
afn1="etc.tar.gzip"
afn2="etc.tar.bzip"
archive1=`tar -czf ~/$afn1 /etc/*`
# Archive and compress the files and directories in /etc
# using tar and bzip2
archive2=`tar -cjfy ~/$afn2 /etc/*` 
# Evaluate the file size of each compressed file using fileSize()
# for a in ${archives[@]}; do
# 	echo fileSize($a)
# done
a=fileSize($archive1)
b=fileSize($archives2)
if [ $a -gt $b ]; then
	echo "Gzip file is $(($a - $b)) larger than BZip file";
else:
	echo "Bzip2 file is $(($b - $a)) larger than Gzip file";
fi


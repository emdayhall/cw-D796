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
	vf=`du $1`
	file_size=${vf:0:$((${#vf}-${#1}))}
	echo $file_size
}

# archive file names
afn1="etc.tar.gzip"
afn2="etc.tar.bzip"

# Archive and compress the files and directories in /etc using tar andgzip2
archive1=`tar -czf $afn1 /etc/* &> /dev/null`
# Archive and compress the files and directories in /etc using tar and bzip2
archive2=`tar -cjf $afn2 /etc/* &> /dev/null` 
# Get the file sizes for the archives using fileSize() function
declare -i a=$(fileSize "$afn1") 
declare -i b=$(fileSize "$afn2")

# Determine the larger file and report the size delta to the CMD
if [[ $a -gt $b ]]; then
	echo "Gzip file is $((a - b)) larger than BZip file";
else
	echo "Bzip2 file is $((b - a)) larger than Gzip file";
fi


#!/bin/bash
#Written by Micheal Lyons and modified by Benjamin Turner
#This bash script is used to backup a user's home directory to /tmp/.
user=$(whoami)
input=/home/$user
output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
#The function total_files reports a total number of files
#for a given directory
function total_files {
        find $1 -type f | wc -l
}
#The function total_directories reports a total number of directories
#for a given directory. 
function total_directories {
        find $1 -type d | wc -l
}
#Dumps home directory to a .tar file and writes to an error log if failed
tar -czvf $output $input 2>>/tmp/Linux_Home_Dir_Backup_Script-ErrorLog.txt
echo -n "Files to be included:"
total_files $input
echo -n "Directories to be included:"
total_directories $input
echo "Backup of $input completed!"
echo "Details about the output backup file:"
ls -l $output

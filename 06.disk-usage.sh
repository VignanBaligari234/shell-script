#!/bin/bash

#colors
#validations
#logredirection

LOG_FILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOG_FILE_DIRECTORY/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USAGE_THRESHOLD=1
message=""

while IFS= read line
do
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)

    partition=$(echo $line | awk '{print $1}')

    if [ $usage -gt $DISK_USAGE_THRESHOLD ]
    then
        message+="high disk usage on $partition: $usage \n"
    fi

done <<< $DISK_USAGE

echo -e "message: $message"

echo "$message" | mail -s "high disk usage" vignan.baligari@gmail.com

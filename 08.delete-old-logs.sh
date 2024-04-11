#!/bin/bash

APP_LOGS_DIR=/home/centos/app.logs

DATE=$(date +%F)
LOG_FILE_DIRECTORY=/home/centos/shellscript.logs
SCRIPT_NAME=$0
LOGFILE=$LOG_FILE_DIRECTORY/$0-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "$FILES_TO_DELETE"

#!/bin/bash

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

USER=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 ...$R Failure $N"
        exit 1
    else
        echo -e "$2 ...$G Success $N"
    fi
}
if [ $USER -ne 0 ]
then
    echo "ERROR:: User is not a root user please run with root access"
    exit 1
fi

yum install git -y &>>$LOGFILE

VALIDATE $? "installing git"

yum install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql"
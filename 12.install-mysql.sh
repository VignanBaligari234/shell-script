#!/bin/bash

USER=$(id -u)
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 ...Failure"
        exit 1
    else
        echo "$2 ... success"
    fi
}
if [ $USER -ne 0 ]
then
    echo "ERROR:: User is not a root user please run with root access"
    exit 1
fi

yum install git -y

VALIDATE $? "installing git"

yum install mysql -y

VALIDATE $? "installing mysql"
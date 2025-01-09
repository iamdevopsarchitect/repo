#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privilages $N" &>>$LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R Failed $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is... $G Success $N" &>>$LOG_FILE
    fi

}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh $0 package1 package2 ... "
    exit 1
}

CHECK_ROOT

IF [ &# -EQ 0]
then
    USAGE

for package in $@ # refers to all argumenrts passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." &>>$LOG_FILE
        dnf install $package -y  &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed.. Nothing To Do $N" &>>$LOG_FILE
    fi
done
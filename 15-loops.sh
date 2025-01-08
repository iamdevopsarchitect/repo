#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privilages"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R Failed $N"
        exit 1
    else
        echo -e "$2 is... $G Success $N"
    fi

}

CHECK_ROOT


# sh 15-loops.sh git mysql postfix nginx
for package in $@ # refers to all argumenrts passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed.. Nothing To Do"
    fi
done
#!/bin/bash

USERID=$(id -u)
#echo "User id is : $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...Failed."
        exit 1
    else
        echo "$2 is Success"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privilages"
    exit 1
fi

dnf list installed git


if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed... going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed.. nothing to do"
fi


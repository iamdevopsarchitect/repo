#!/bin/bash

USERID=$(ID -U)

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privilages"
fi

dnf install git -y
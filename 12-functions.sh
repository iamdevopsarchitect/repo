#!/bin/bash

USERID=$(id -u)
#echo "User id is : $USERID"

VALIDATE(){
    echo "EXIT STATUS: $1"

}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privilages"
    exit 1
fi

dnf list installed git

VALIDATE $?

# if [ $? -ne 0 ]
# then
#     echo "Git is not installed, going to install it.."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "Git installation is not success...check it"
#         exit 1
#     else
#         echo "Git installation is success"
#     fi
# else
#     echo "Git is already installed, nothing to do.."
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then
#     echo "MySQL is not installed... going to install"
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "MySQL instalation is failure..please check"
#         exit 1
#     else
#         echo "MySQL installation is success"
#     fi
# else
#     echo "MySQL is already installed.. nothing to do"
# fi


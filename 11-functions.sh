#!/bin/bash

USER=$(id -u)

VALIDATE(){
    if [$1 -ne 0]
    then
    echo "$2 .....FAILURE"
    exit 1
    else echo "$2 .....SUCCESS"
    fi
}

if [$USERID -ne 0]
then 
echo "ERROR : You must have sudo access to execute this script"
exit 1 #other than 0
fi
dnd  list installed mysql

if [$? -ne 0]
then # not installed
dnf install mysql -y
VALIDATE $? "Installing MYSQL"
else 
echo "MYSQL is already .... INSTALLED"
 fi
 dnf list installed git 

 if [$? -ne 0]
then 
dnf install git -y
VALIDATE $? "Installing git"
else
echo "git is already ... INSTALLED"
fi
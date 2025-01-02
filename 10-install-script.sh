#!/bin/bash

USER=$(id -u)

if [$USERID -ne 0]
then 
echo "ERROR : You must have sudo access to execute this script"
exit 1 #other than 0
fi
dnd  list installed mysql

if [$? -ne 0]
then # not installed
dnf install mysql -y
if [$? -ne 0]
then
 echo "Installimg MYSQL .... FAILURE"
exit 1
else
echo "Installing MYSQL ... SUCCESS"
fi
echo "MYSQL is already ... INSTALLED"
fi
 dnf list installed git
 
 if [$? -ne 0]
then 
dnf install git -y

if [$? -ne 0]
then 
echo "INSTALLING git ...FAILURE"
exit 1
else 
echo "INSTALLING git ...SUCCESS"
fi
else
echo "git is already ... INSTALLED"
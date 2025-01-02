#!/bin/bash

USER=$(id -u)

LOGS_FOLDER="var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE-NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [$1 -ne 0]
    then
    echo "$2 .....FAILURE"
    exit 1
    else echo "$2 .....SUCCESS"
    fi
}

echo "script started exceuting at time: "$TIMESTAMP" &>>$LOG_FILE_NAME
if [$USERID -ne 0]
then 
echo "ERROR : You must have sudo access to execute this script"
exit 1 #other than 0
fi
dnd  list installed mysql &>>$LOF_FILE_NAME

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
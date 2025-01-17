#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\E[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/home/ec2-user/app-log"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m=%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi

}
CHECK_ROOT(){

    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: you must have access to execute this script"
        exit 1
    fi
}
echo "script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

FILES_TO_DELETE=$(find $SOURCE_DIR -name ".log" -mtime +14 )
echo "files to be deleted : $FILES_TO_DELETE"

while read -r filepath
do
   echo  "deleting file :  $filepath" &>>$LOG_FILE_NAME
   rm -rf $filepath
   echo "Deleted file : $filepath"
done <<< $FILES



done <<<$FILE_TO_DELETE

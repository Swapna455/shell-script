#!/bin/bash


R="\e[31m"
G="\E[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${ 3;-14 }  # if user is not providing number of days,we are taking 14 as default

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m=%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

    

    


USAGE(){
    echo -e "$R USAGE :: $N sh 18-backups.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
    exit 1

    
}

mkdir -p /home/ec2-user/shellscript-logs/

if [ $# -lt 2 ]
then
    USAGE
fi
 
if [ ! -d "$SOURCE_DIR "]
then
    echo -e "$SOURCE_DIR does not exist .... please check"
    exit 1
fi

if [ ! -d "$DEST_DIR"  ]
then
    echo -e "$DEST_DIR does not exist ... please check"
    exit 1
fi

echo  "script started exceuting at :: $TIMESTAMP"  &>>$LOG_FILE_NAME
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$days)



if [ -n "$FILES"]
then
     echo "Files are: $FILES"
     ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP .zip"
     find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
     if [ -f "$ZIP_FILE" ]
then
    echo -e "successfullr created zip file for older $DAYs"
    while read -r filepath
    do
         echo  "deleting file :  $filepath" &>>$LOG_FILE_NAME
         rm -rf $filepath
         echo "Deleted file : $filepath"



    done <<< $FILES

else
     echo -e "$R Error :: $N Failed to create ZIP file "
     exit 1
fi

else  

     echo  "NO files found older than $DAYS"
fi





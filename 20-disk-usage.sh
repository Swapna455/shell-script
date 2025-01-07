#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLDS=5 # real project will monitor for 70
MSG=""

while read -r line
do
   USAGE=$( echo $line | awk  -F " "  '{print $6F}' | cut -d "%" -f1 ) 
   PARTITION=$(echo $line | awk -F " " '{print $NF}')
   #echo "partition:  $PARTITION , Usage:  $USAGE" 
   if [ $USAGE  -ge $DISK_THRESHOLD ]
   then
       MSG="High Disk usage on partition: $PARTITION Usage is : $USAGE"

done  <<<  $DISK_USAGE

echo  "Message: $MSG "
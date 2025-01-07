#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs)
DISK_THRESHOLDS=5 # real project will monitor for 70

while read -r line
do
   USAGE=$( echo $line | awk  -F " "  '{print $6F}' ) 
   PARTITION=$(echo $line | awk -F " " '{print $NF}')
   echo "partition:  $PARTITION , Usage:  $USAGE"     
done <<<$DISK_USAGE
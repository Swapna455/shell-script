#!/bin/bash

if [$# -ne 1 ]
then
    echo "usage: $0 <file>"
    exit 1
fi


#check the file exists
if [! "$!"]
then
    echo "Error: File '$1' not found!"
    exit 1
fi

echo "Top 5 most frequent words"  
tr  -c '[:alunum:]' '[\n*]' <"$1" |  #split words by non-alphanumeric characters
tr '[:upper:]' '[lower]'       #convert to lower case
sort      # sort words
uniq -c |  # count unique occurences
sort -nr |  # sort by frequency in descending order
head -n 5  # display the top 5 words
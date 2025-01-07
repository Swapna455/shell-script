#!/bin/bash

# Check if the input file and output file are provided as arguments
if [ $# -ne 2 ]; 
then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file=$1
output_file=$2

# Check if the input file exists
if [ ! -f "$input_file" ]; 
then
    echo "Error: File \"$input_file\" not found!"
    exit 1
fi

# Reverse each line and save it to the output file
while read -r line; 
do
    echo "$line" | rev
done < "$input_file" > "$output_file"



echo "Reversed content has been saved to '$output_file'."

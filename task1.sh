#!/usr/bin/bash

# Changing the line spacing of a text file
#    Write a script that reads each line of a target file, then writes the line back to stdout, but with an extra blank line following. This has the effect of double-spacing the file.


file=$1

stringcon=""

while read -r line
do
    stringcon+="$line\n\n"
done < $file

# echo -e "\nAfter Spacing :\n$stringcon"

echo -e "$stringcon"> $file 2>&1

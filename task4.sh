#!/usr/bin/bash

# Managing Disk Space
#   List, one at a time, all files larger than 100K in the /home/username directory tree. Give the user the option to delete or compress the file, then proceed to show the next one.
#       Write to a logfile the names of all deleted files and the deletion times



findcomm=$(find $1 -type f -size +100k)

filesfound=()

while IFS= read -r files;  #Seperating files to another array
do
    filesfound+=("$files")
done <<< "$findcomm"

deletedfilecom=$(touch deletedfiles.log)

for (( i=0; i<${#filesfound[@]}; i++ )) #printing file name & giving user options
do
    echo ${filesfound[i]} is larger than 100KB

    select Selcetion in Delete Compress
    do
        if [ $Selcetion == Delete ]
        then
            deletecomm="rm -f ${filesfound[i]}"
            $deletecomm

            echo -e "File ${filesfound[i]} has been Deleted"

            loggingcom=$(cat <<< ${filesfound[i]} >> deletedfiles.log)
            datecomm=$(date)
            datestcomm=$(cat <<< $datecomm >> deletedfiles.log)
            
            echo -e "Deleted File name has been logged\n"

            break
        elif  [ $Selcetion == Compress ]
        then
            Compresscom="zip "${filesfound[i]}.zip" "${filesfound[i]}""
            $Compresscom

            echo -e "File ${filesfound[i]} has been zipped\n"
            break
        else
            echo -e "Invalid input, try again\n"
        fi
    done
done
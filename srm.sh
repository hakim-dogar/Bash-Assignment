#!/usr/bin/bash

#Safe Delete
#   Write, as a script, a “safe” delete command, srm.sh.
#   Filenames passed as command-line arguments to this script are not deleted, but instead gzipped if not already compressed (use file to check), then moved to a /home/username/trash directory.
#   At invocation, the script checks the “trash” directory for files older than 48 hours and deletes them.


for i in $@;
do
    extension="${i##*.}"           #extracting extension.

    if [ "$extension" != "gz" ] && [ "$extension" != "zip" ] && [ "$extension" != "tar" ]  #gz is gzip file extension
    then
        Compresscom="gzip "$i""
        $Compresscom

        trashcomm="gio trash $i.gz"
        $trashcomm
    else
        trashcomm="gio trash $i"
        $trashcomm
    fi
done

finddeletecomm=$(find /home/eurus/.local/share/Trash/files -type f -mmin +2880)

emptycomm=$(gio remove -f $finddeletecomm) 
#!/usr/bin/bash

# Logged in User Information
#   For all logged in users, show their names and the time and date of their last login.
#       Hint: use who, lastlog, and parse /etc/passwd.



loginusr="who"

echo "Using who Commad"
$loginusr | while read username tty2 date time info
do  
    echo -e "Username: $username,   Date: $date,   time: $time"
done

usrdata="lastlog"
i=0

echo -e "\nUsing Lastlog Commad"
$usrdata | while read -r username lastlogin
do
    if (( i == 0 ))
    then 
        (( i++ ))
        continue
    fi

    if [ "$lastlogin" != "**Never logged in**" ]
    then
        echo -e "Username: $username,   Inofrmation: $lastlogin"
    fi
done

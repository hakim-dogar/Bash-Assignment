#!/usr/bin/bash

# Write a script which will test how many logins you and the ‘root’ user have and tell  who has the most (or if equal)

whocomm=$(whoami)

usertimes=$(last | grep "$whocomm" | wc -l)

roottimes=$(last | grep "root" | wc -l)

echo -e "$whocomm has $usertimes logins\n"

echo -e "Root has $roottimes logins\n"

if (( $usertimes > $roottimes ))
then
    echo -e "$whocomm has most loggin than root\n"
else
    echo -e "root has most loggin than $whoami \n"
fi
#!/usr/bin/bash

printingforARGV(){
    local start=$1
    local incremental=$2
    local ending=$3

    i=$start
    while (( i <= $ending ))
    do
        echo "$i"
        (( i+=$incremental ))
    done
}

if [ "$1" == "-h" ]             # Help Case
then
    echo "Help Manual"
    echo "Give arguments during execution of script"
    echo "1 argument will display 1 to the argument value"
    echo "2 arguments will display numbers starting form 1st arugement to 2nd argument"
    echo "3 arguments will display the numbers with increment of 2nd argument with start from 1st argument to the 3rd argument."
    exit 0
elif [ $# -eq 1 ]               # First Case
then
    printingforARGV 1 1 $1
elif [ $# -eq 2 ]               # Second Case
then
    printingforARGV $1 1 $2
elif [ $# -eq 3 ]               # Third Case
then
    printingforARGV $1 $2 $3
else                            # Error Case
    echo "Error, no or more than three arguments passed"
    echo "Please send -h for help"
    exit 0
fi
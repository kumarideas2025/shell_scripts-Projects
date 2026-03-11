#!/bin/bash
date

# Variable
BASE=/home/kowshik/Learn_scripts
DAYS=10
DEPTH=1
RUN=0

# check if directory exists
if [ ! -d $BASE ]
then
        echo "Directory does not exist : $BASE"
        exit 1
fi

# create archive folder if not present
if [ ! -d $BASE/Kowshik ]
then
        mkdir $BASE/Kowshik
fi

# find files larger than 50MB
for i in $(find $BASE -maxdepth $DEPTH -type f -size +50M)
do
        if [ $RUN -eq 0 ]
        then
                gzip "$i" || exit 1
                mv "$i.gz" $BASE/Kowshik || exit 1
        fi
done

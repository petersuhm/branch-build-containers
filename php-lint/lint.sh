#!/bin/bash

# First argument is the directory to run in
# All other arguments are directories to skip

# Save directory to run in
path=$1

# Shift arguments 
shift

# Loop over all directories and create skip arguments for that directory
excludes=""
for dir in $@
do 
    excludes="$excludes -path ./$dir -prune -o"
done

error=false
for file in `find $path $excludes -type f -name '*.php'`
do
    EXTENSION="${file##*.}"

    if [ "$EXTENSION" == "php" ] || [ "$EXTENSION" == "phtml" ]
    then
        RESULTS=`php -l $file`

        if [ "$RESULTS" != "No syntax errors detected in $file" ]
        then
            error=true
            echo $RESULTS
        fi
    fi
done

if [ "$error" = true ] ; then
    exit 1
else
    exit 0
fi

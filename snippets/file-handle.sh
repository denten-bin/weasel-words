#!/bin/bash

# a snippet to handle file names as arguments
# strips "a/path/to/file-name.txt" to "file-name"

## pass the file name as an argument

if [ $# -eq 0 ]
then
        echo "pass the file name"
        exit
fi

source=$1

# Strip the path and the name

# start with path/to/file-name.txt
# strip to file-name.txt
t="${source##*/}"

# strip to file-name
target="${t%.*}"

# make sure the reports directory exists
mkdir -p ../weasel-reports/

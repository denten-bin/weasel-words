#!/bin/bash

## pass the file name as an argument

if [ $# -eq 0 ]
then
        echo "pass the file name"
        exit
fi

source=$1

# Strip the path and the name

# start with path/to/my-file.txt
# strip to my-file.txt
t="${source##*/}"

# strip to my-file
target="${t%.*}"

# start the stream | subst. space for new line
# remove puncuation | get rid of empty lines
# get uniq count | sort by count | write to file

cat "$source" | sed 's/\s/\n/g' | tr -d '[:punct:]' | sed '/^$/d' | \
    sort | uniq -c | sort -hr > "$target"-freq.txt



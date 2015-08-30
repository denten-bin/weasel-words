#!/bin/bash

# a snippet to handle the passed in file name

## pass the file name and stopwords dictionary as an argument

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
# relative to where we run the script
mkdir -p weasel-reports/

# consider converting to snippets
# to share file handling in the bundle
# see https://web.archive.org/web/20150830151023/http://mywiki.wooledge.org/BashFAQ/028
# get script path for imports
# DIR="${BASH_SOURCE%/*}"
# if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
# . "$DIR/snippets/file-handle.sh"
# . "$DIR/freq.sh"

# start the stream | subst. space for new line
# remove puncuation | get rid of empty lines
# get uniq count | sort by count | write to file

# add convert all to lower case
cat "$source" | sed 's/\s/\n/g' | tr -d '[:punct:]' | sed '/^$/d' | \
    sort | uniq -c | sort -hr > weasel-reports/"$target"-freq.txt

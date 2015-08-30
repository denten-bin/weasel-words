#!/bin/bash

source snippets/file-handle.sh

# start the stream | subst. space for new line
# remove puncuation | get rid of empty lines
# get uniq count | sort by count | write to file

#cat "$source" | sed 's/\s/\n/g' | tr -d '[:punct:]' | sed '/^$/d' | \
#    sort | uniq -c | sort -hr > weasel-reports/"$target"-freq.txt

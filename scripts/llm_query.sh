#!/bin/bash

current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")
directory=~/Documents/llm_queries
mkdir -p $directory
filename="${directory}/query_${current_datetime}.txt"

echo $1
llm_query() {
  echo "$1" >> $filename
  echo ''
  llm "$1" >> $filename
  echo "created file: $filename"
  less $filename | sed 's/\\//g' | batcat --language markdown
}

if [ $# -eq 0 ]; then
  'A query must be provided as argument when calling this script.'
else
  llm_query "$1"
fi

echo 'Done!'

#!/bin/bash

if [ $# -eq 0 ]; then
  echo 'A file must be provided as argument.'
else
  cat $1 |  sed 's/\\//g' | batcat --language markdown
fi

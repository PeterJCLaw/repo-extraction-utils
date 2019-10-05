#!/bin/sh -e

# This script helps find all the historic names of files in a given diretory.
# It could easily be adapted to work with a list of files instead of a directory.

DIRECTORY="$1"

if [ -z "$DIRECTORY" ]
then
  echo "Usage: $(basename $0) DIRECTORY"
  exit 1
fi

find $DIRECTORY -type f | xargs -l git log --format='' --name-only  --find-copies-harder -M50% -C50%  --follow | sort -u

#!/bin/sh

# This script is the argument to --index-filter and acts to remove files
# which are not those which have been selected for extracting into the new
# git repository.

git read-tree --empty

# Modify this line to list all the historic names of the files you want to
# keep, perhaps from running `find-all-names.sh`.
git reset $GIT_COMMIT -- YOUR FILES HERE

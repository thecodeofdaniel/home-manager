#!/bin/env bash

echo "Executing backupfile script!"

# Check if argument is passed
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file_link_path>"
  exit 1
fi

# Grab the argument which is path to a file
file=$1

# Check if the given path is a symbolic link
if [ ! -f "$file" ]; then
  echo "$file does not exist."
  exit 1
fi

cp $file "$file.bak"
rm $file

echo "Backed up file: $file to $file.bak"

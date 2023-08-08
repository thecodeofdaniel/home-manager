#!/bin/env bash

echo "Executing link2file script!"

# Check if argument is passed
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file_link_path>"
  exit 1
fi

# Grab the argument which is path to a file
file_link_path=$1

# Check if the given path is a symbolic link
if [ ! -L "$file_link_path" ]; then
  echo "$file_link_path is not a symbolic link."
  exit 1
fi

target_file=$(readlink -f "$file_link_path")

# Check if the target file exists
if [ ! -e "$target_file" ]; then
  echo "The target file '$target_file' does not exist."
  exit 1
fi

# Create a copy of the target file
cp "$target_file" "${file_link_path}_copy"

# Remove the symbolic link
rm "$file_link_path"

# Rename the copied file to the name of the symbolic link
mv "${file_link_path}_copy" "$file_link_path"

chmod 664 "$file_link_path"

echo "Symbolic link converted to a regular file: $file_link_path"

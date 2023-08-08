#!/bin/env bash

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

# Create a temporary directory to store the contents
temp_dir=$(mktemp -d)

# # Get the absolute path of the target directory
# target_directory=$(readlink -f "$symbolic_link")

# Copy the contents of the target directory to the temporary directory
cp -r "$file_link_path"/* "$temp_dir"

# Remove the symbolic link
rm "$file_link_path"

# Recreate the symbolic link as a regular directory
mv "$temp_dir" "$file_link_path"

chmod 775 "$file_link_path"
chmod 664 "$file_link_path"/*

echo "Symbolic link converted to a regular directory: $file_link_path"

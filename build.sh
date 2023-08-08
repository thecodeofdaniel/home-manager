#!/bin/env bash

HM="$HOME/.config/home-manager"

# Check if the script is being run in correct directory
if [[ "$PWD" != "$HM" ]]; then
    echo "Please run script in this dir: \"${HM}\""
    exit 1
fi

# Remove the symlink result dir
rm "$HM/result" >/dev/null 2>&1

# Files that will be manipulated
files=(
    # VSCode files
    "$HOME/.config/Code/User/keybindings.json"
    "$HOME/.config/Code/User/settings.json"
)

# Turn the symlinks into regular files
for file in "${files[@]}"
do
    backupfile $file
done

# Build config
home-manager build

# If result symlink is not found then exit
# otherwise activate config
if ! [ -L "result" ]; then
    exit 1
else
    bash ./scripts/install_pkgs.sh
    $HM/result/activate
fi

# Turn the symlinks into regular files
for file in "${files[@]}"
do
    link2file $file
done

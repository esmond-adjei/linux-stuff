#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: create_folder.sh <folder_name> [<folder_name2> ...]"
  exit 1
fi

for folder_name in "$@"; do
  if [ -d "$folder_name" ]; then
    echo "Folder '$folder_name' already exists. Skippiing.."
  else
    # Create the folder with the given name
    mkdir "$folder_name"

    # Create a README.md file inside the folder
    echo "# $folder_name" > "$folder_name/README.md"
    echo "Initialized repo: $folder_name"
  fi
done


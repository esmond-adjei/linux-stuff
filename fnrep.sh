#!/bin/bash

# Check if two arguments were provided
if [ $# -ne 2 ]; then
  echo "Error: two arguments are required (word one and word two)"
  exit 1
fi

word_one=$1
word_two=$2

# Initialize counters
count=0
files=()

# Find all files in the current directory
for file in ./*; do
  # Check if the file is a regular file (not a directory, etc.)
  if [ -f "$file" ]; then
    # Use sed to replace word one with word two in the file
    sed -i "s/$word_one/$word_two/g" "$file"

    # Check if the replacement was made
    if [ $? -eq 0 ]; then
      # Increment the count of replaced words
      count=$((count + 1))
      # Add the file to the list of modified files
      files+=("$file")
    fi
  fi
done

# Print the completion message
echo "Replaced $count instances of '$word_one' with '$word_two'"
if [ ${#files[@]} -gt 0 ]; then
  echo "Modified files:"
  printf '\t%s\n' "${files[@]}"
fi

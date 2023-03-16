#!/bin/bash

# check if at least one argument is provided
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 file1.py [file2.py] [file3.py] ..."
    exit 1
fi

# create flag to indicate whether to open the file in vim
open_vim=true

# loop through all arguments
for filename in "$@"; do
    # check if the file already exists
    if [[ -e "$filename" ]]; then
        echo "$filename already exists. Skipping."
        continue
    fi

    # create the file with the first line
    echo '#!/usr/bin/python3' > "$filename"
    chmod +x "$filename"

    # don't open vim if creating multiple files
    if [[ $# -gt 1 ]]; then
        open_vim=false
    fi

done

# open the first file in vim if creating a single file
if [[ $open_vim == true ]]; then
    vim "$1"
fi


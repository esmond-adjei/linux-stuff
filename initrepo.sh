#!/bin/bash

folderName=$1

# Creating the folder
mkdir $folderName

# Changing directory into the folder
cd $folderName

# Replacing _ and - with spaces
folderName=${folderName//_/ }
folderName=${folder//-/ }

# Creating the README.md file
echo "# $folderName" >> README.md

echo "Folder $folderName created successfully and Changed directory into that folder"

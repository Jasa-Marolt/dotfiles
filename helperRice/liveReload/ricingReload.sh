#!/bin/bash

# Change to the directory containing the scripts
cd ./enabled/

# Loop through all files in the current directory
for file in *; do
  # Check if the file is a regular file AND is executable
  if [ -x "$file" ] && [ -f "$file" ]; then
    echo "Executing $file..."
    ./"$file"
  fi
done

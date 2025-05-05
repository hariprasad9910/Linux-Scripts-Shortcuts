# Extract Zip Files Script

## Purpose
This script is designed to extract all `.zip` files in the current directory into separate folders. Each zip file is extracted into a folder named after the file (without the `.zip` extension).

## Script

```bash
#!/usr/bin/bash

# Purpose: Extract all zip files in the current directory into separate folders

# Check if any zip files exist before attempting to process them
if ls *.zip >/dev/null 2>&1; then
  # Loop through each zip file in the current directory
  for file in *.zip; do
    # Extract the file name without the .zip extension
    folder_name="${file%.zip}"
    
    # Create a directory with the same name as the zip file (without extension)
    mkdir -p "$folder_name"
    
    # Unzip the file into the created directory
    unzip "$file" -d "$folder_name"
    
    # Print status message
    echo "Extracted $file to $folder_name/"
  done
  
  echo "All zip files have been extracted."
else
  # Provide feedback if no zip files are found
  echo "No zip files found in the current directory."
  exit 1
fi

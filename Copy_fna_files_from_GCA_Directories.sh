# 🧬 Script: Copy `.fna` Files from GCA_* Directories

This Bash script copies the **first `.fna` file** from each `GCA_*` subdirectory into a `target_folder`. 
It's useful when organizing genomic data from NCBI or similar sources.

```bash
#!/usr/bin/bash

# Create the target folder if it doesn't exist
mkdir -p target_folder

# Find the first .fna file in each GCA_* directory and copy it to target_folder
# Error: This script will only copy one .fna file total due to the loop logic
# Corrected version below

# Loop through all directories matching "GCA_*" pattern
for dir in $(find . -type d -name "GCA_*" | sort | uniq); do
  # Find the first .fna file in the current directory
  fna_file=$(find "$dir" -type f -name "*.fna" | head -n 1)
  
  # Check if an .fna file was found
  if [ -n "$fna_file" ]; then
    # Extract just the filename from the path for more informative output
    filename=$(basename "$fna_file")
    
    # Copy the file to the target folder
    cp "$fna_file" target_folder/
    
    # Provide feedback about the copied file
    echo "Copied $filename from $dir to target_folder/"
  else
    # Inform if no .fna file was found in this directory
    echo "No .fna files found in $dir"
  fi
done

# Inform user that the operation is complete
echo "File copying complete. Check target_folder/ for results."

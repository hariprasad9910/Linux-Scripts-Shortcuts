#Count the Files in a Folder of a Particular Pattern

ls *.mol 2>/dev/null | wc -l

#Select and Extract Specific Columns from a .csv File

cut -d ',' -f1,7 data.csv > output.csv

#Split a Single File into Separate Files Based on Accession IDs

awk '/^>/ {if (out) close(out); out=substr($0, 2)".fasta"} {print > out}' your.fasta

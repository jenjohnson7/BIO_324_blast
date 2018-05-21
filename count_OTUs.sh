#!/bin/bash

# usage message
[ $# -eq 0 ] && { echo "Usage: $0 <num_results> to take from each .out file"; exit 1; }

echo "writes top N results from all .out files into a single file"

seq_files=$( ls *.out )
output_file="top"$1".txt"
echo $output_file

for file in $seq_files; do
    echo "reading" $file
    python /Users/jen/Desktop/BIO324_blast/write_top_results.py $1 $file $output_file
done

Rscript /Users/jen/Desktop/BIO324_blast/count_OTUs.R $output_file

mv Rplots.pdf "top_"$1"_Rplots.pdf"

#!/bin/bash

echo "writes all trimmed_seq into a fasta file for MSA"

seq_files=$( ls *_trimmed.seq )
output_file="msa.txt"

for file in $seq_files; do
    echo "adding" $file "to msa"
    echo $file
    python /Users/jen/Desktop/BIO324_blast/add_to_msa.py $file $output_file
done

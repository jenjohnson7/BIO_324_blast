#!/bin/bash

# must run with an integer for the target_num_results

# usage message
[ $# -eq 0 ] && { echo "Usage: $0 num_results"; exit 1; }

echo "automates blasts for .seq files"

seq_files=`ls *.seq`
trimmed_file_suffix=".seq"
outfile_suffix=".out"

for file in $seq_files
do
  file_prefix=${file%.*}
  trimmed_file=$file_prefix"_trimmed"$trimmed_file_suffix
  outfile=$file_prefix$outfile_suffix

  echo "----------------------------"

  echo "trimming" $file "and saving to" $trimmed_file

  python /Users/jen/Desktop/BIO324_blast/simple_trim.py $file $trimmed_file

  echo "starting search for" $trimmed_file "and saving to" $outfile

  /Users/jen/ncbi-blast-2.7.1+/bin/blastn -db nt -query $trimmed_file  -out $outfile -remote

  echo "reading top" $1 "results from" $outfile

  python /Users/jen/Desktop/BIO324_blast/get_top_results.py $outfile $1

done

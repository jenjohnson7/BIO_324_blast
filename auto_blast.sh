#!/bin/bash
echo "automates blasts for .seq files"

seq_files=`ls *.seq`
trimmed_file_suffix=".seq"
outfile_suffix=".out"

for file in $seq_files
do
  file_prefix=${file%.*}
  trimmed_file=$file_prefix"_trimmed"$trimmed_file_suffix
  outfile=$file_prefix$outfile_suffix

  echo "trimming" $file "and saving to" $trimmed_file

  python /Users/jen/Desktop/BIO_324_blast/simple_trim.py $file $trimmed_file

  echo "starting search for" $trimmed_file "and saving to" $outfile

  /Users/jen/ncbi-blast-2.7.1+/bin/blastn -db nt -query $trimmed_file  -out $outfile -remote
  # to do: how to add filters/parameters to make query more specific
  # to do: how to filter results to get only the relevant info
  # to do: how to put results into a separate dir
done

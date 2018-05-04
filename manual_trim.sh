seq_files=`ls *.seq`
trimmed_file_suffix=".seq"
outfile_suffix=".out"

for file in $seq_files

  do
    file_prefix=${file%.*}
    trimmed_file=$file_prefix"_manually_trimmed"$trimmed_file_suffix
    outfile=$file_prefix$outfile_suffix

    echo "----------------------------"

    echo "trimming" $file "and saving to" $trimmed_file

    read start

    read finish

    python /Users/jen/Desktop/BIO324_blast/manual_trim.py $file $trimmed_file $start $finish

  done

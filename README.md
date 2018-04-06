# BIO_324_blast
Automatically trims and uses blastn to query sequences in .seq format

BIO324 S18

python script simple_trim.py 
1 reads .seq/fasta format using BioPython library (conda install BioPython or pip install BioPython)
2 trims the leading and ending Ns from a sequence
3 writes the trimmed sequence into a new fasta file

Blast+ tool

https://www.ncbi.nlm.nih.gov/books/NBK52640/
Official User Manual installation

https://www.ncbi.nlm.nih.gov/books/NBK279685/#cookbook.BLAST_remote_service
Docs: how to query remotely

auto_blast.sh 
1 gets a list of all .seq files in the current directory
2 trims using simple_trim.py
3 queries using Blast+ tool
4 writes output to *.out

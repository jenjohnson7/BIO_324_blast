# BIO_324_blast
Automatically trims and uses blastn to query sequences in .seq format

BIO324 S18

python script simple_trim.py
1 reads .seq/fasta format using BioPython library (conda install BioPython or pip install BioPython)
2 trims the leading and ending Ns from a sequence (simple_trim.py)
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
5 uses get_top_results.py to print the top few results to the cl

manual_trim.sh
takes a list of files to trim manually from a dir
manual_trim.py
takes start and finish indices to trim by
writes to a new trimmed file

prepare_msa.sh/add_to_msa.py
reads seq from a set of *trimmed.seq files
gets the top blast hit as a label
writes to msa.txt
Then, msa.txt can be used in the online Clustal Omega application.

count_OTUs.sh
reads top N results from the BLAST .out file
records into a txt file (write_top_results.py)
uses count_OTUs.R to visualize results

count_OTUs.R
used by count_OTUs.sh
takes list of top N results from txt file
writes bar graph for top species found

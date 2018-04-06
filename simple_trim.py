# Greedy/Unintelligent method of trimming .seq files

from Bio import SeqIO
import sys

if len(sys.argv)!= 2:
    print("Usage: python simple_trim.py <input_file> <output_file>")

else:

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    for seq_record in SeqIO.parse(input_file, "fasta"):
        my_seq = seq_record.seq

        i=0
        while my_seq[i]=="N":
            i+=1

        j=len(my_seq)-1
        while my_seq[j]=="N":
            j-=1

        trimmed_seq = str(my_seq[i:j])

        my_header = seq_record.id

        out = open(output_file, "w")
        out.write(">" + my_header + "\n")
        out.write(trimmed_seq)
        out.close()

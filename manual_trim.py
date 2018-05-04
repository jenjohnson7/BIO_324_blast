from Bio import SeqIO
import sys

if len(sys.argv)!= 5:
    print("Usage: python simple_trim.py <input_file> <output_file> <start_position> <end_position>")

else:

    input_file = sys.argv[1]
    output_file = sys.argv[2]
    start = int(sys.argv[3])
    end = int(sys.argv[4])

    for seq_record in SeqIO.parse(input_file, "fasta"):
        my_seq = seq_record.seq

        trimmed_seq = str(my_seq[start:end])

        my_header = seq_record.id

        out = open(output_file, "w")
        out.write(">" + my_header + "\n")
        out.write(trimmed_seq)
        out.close()

from Bio import SeqIO
import sys

if len(sys.argv)!= 3:
    print("Usage: python add_to_msa.py <input_file> <msa_file>")

else:
    input_file = sys.argv[1]
    output_file = sys.argv[2]

    results_file = input_file.replace("_trimmed.seq", ".out")

    with open(results_file) as f:
        content = f.readlines()
        content = [x.strip() for x in content]
        content = content[22:22+1]
        content = content[0]
        content = content.split("  ")[1]

    for seq_record in SeqIO.parse(input_file, "fasta"):
        my_seq = str(seq_record.seq)

        my_header = seq_record.id + str(content)

        out = open(output_file, "a")
        out.write(">" + my_header + "\n")
        out.write(my_seq + "\n")
        out.close()

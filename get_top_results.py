# part of the pipeline in auto_blast.sh

# arg 1 = filename.out
# arg 2 = number of hits you want to receive

import sys

if (len(sys.argv) != 3):
    print("Usage: python get_top_results.py <filename.out> <target_num_results>")
else:
    filename = sys.argv[1]
    num_results = int(sys.argv[2])

    with open(filename) as f:
        content = f.readlines()

    # remove whitespace characters at the end of each line
    content = [x.strip() for x in content]

    # skip headers and get the next num_results lines
    content = content[22:22+num_results]

    # printing the names
    for elt in content:
        print(elt.split("         ")[0])

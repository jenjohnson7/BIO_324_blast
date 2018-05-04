import sys

if len(sys.argv)!= 4:
    print("Usage: python write_top_results.py <num_results> <input_file> <output_file>")

else:

    filename = sys.argv[2]
    num_results = int(sys.argv[1])
    output_file = sys.argv[3]

    out = open(output_file, "a")

    with open(filename) as f:
        content = f.readlines()

    # remove whitespace characters at the end of each line
    content = [x.strip() for x in content]

    # skip headers and get the next num_results lines
    content = content[22:22+num_results]

    # printing the names
    for elt in content:
        temp = elt.split("         ")[0]
        out.write(temp + "\n")
        
    out.close()

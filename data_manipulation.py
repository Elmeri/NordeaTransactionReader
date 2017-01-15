import sys
print sys.argv[1]
print sys.argv[2]
with open(sys.argv[1], "rt") as fin:
    with open(sys.argv[2], "wt") as fout:
        for line in fin:
            if line != '\n':
                line = line.replace('\'', '')
                fout.write(line.replace('\t', ';'))
            else:
                continue

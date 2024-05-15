import sys
from Bio import AlignIO
from Bio import SeqIO

infile=sys.argv[1]
outfile=sys.argv[2]
gapfilt=float(sys.argv[3])

align=AlignIO.read(infile,"fasta")
alen=len(align[:,0])

output=open(outfile,"w")
for i in range(alen):
    record=align[i,:]
    sequence=record.seq
    gapnum=sequence.count("-")
    gapfrac=gapnum/len(sequence)
    if gapfrac<gapfilt:
        SeqIO.write(record,output,"fasta")



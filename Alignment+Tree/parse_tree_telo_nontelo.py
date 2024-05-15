import sys
from Bio import Phylo
from Bio import SeqIO

# python parse_tree.py TREEFILE ALIGNMENT OUTPUT1 OUTPUT2 GENE
# ex) python parse_tree_telo_nontelo.py RAxML_bipartitions.six_GAG_5_filt six_GAG_AA_MACSE_trimal_5_filt.fasta GAG_set1_telomeric_AA.list GAG_set1_nontelomeric_AA.list GAG
# ex) python parse_tree_telo_nontelo.py RAxML_bipartitions.six_POL_4_filt six_POL_AA_MACSE_trimal_4_filt.fasta POL_set1_telomeric_AA.fasta POL_set1_nontelomeric_AA.fasta POL

input = sys.argv[1]
fasta = sys.argv[2]
output1 = sys.argv[3]
output2 = sys.argv[4]
gene  = sys.argv[5]

telomericGAG=["TART-A_DMEL","TART-B_DMEL","TART-C_DMEL","HeT-A_DMEL","TAHRE_DMEL","TART_DVIR","HeT-A_DYAK"]
telomericPOL=["TART-A_DMEL","TART-B_DMEL","TART-C_DMEL","TAHRE_DMEL","TART_DVIR"]
nontelomericGAG=["jockey_DMEL","Doc_DMEL","Juan_DMEL"]
nontelomericPOL=["jockey_DMEL","Doc_DMEL","F-element_DMEL","Juan_DMEL"]
# nontelomericGAG=["jockey_DMEL","Doc_DMEL"]
# nontelomericPOL=["jockey_DMEL","Doc_DMEL","F-element_DMEL"]


telomeric=[]
nontelomeric=[]
if gene=="GAG":
    telomeric=telomericGAG
    nontelomeric=nontelomericGAG
else:
    telomeric=telomericPOL
    nontelomeric=nontelomericPOL

def compare(mylist,mytaxa,mytree):
    distances=[]
    for element in mylist:
        d=mytree.distance(element,mytaxa)
        distances.append(d)
    return distances

seqdict={}
for record in SeqIO.parse(fasta,"fasta"):
#    print(record.id)
    seqdict[record.id]=record

#seqout_telo=open(output1,"w")
#seqout_nontelo=open(output2,"w")

listout_telo=open(output1,"w")
listout_nontelo=open(output2,"w")

tree = Phylo.read(input, "newick")
for tip in tree.find_clades(terminal=True):
#    print(tip)
    telo=compare(telomeric,tip,tree)
    telo.sort()
    nontelo=compare(nontelomeric,tip,tree)
    nontelo.sort()
    if(nontelo[0] > telo[-1]):
        if tip.name in telomeric:
            continue
#        seqobj=seqdict[tip.name]
#        SeqIO.write(seqobj,seqout_telo,"fasta")
        listout_telo.write(tip.name)
        listout_telo.write('\n')
#    elif(nontelo[-1] < telo[0]):
    else:
        if tip.name in nontelomeric:
            continue
#        seqobj=seqdict[tip.name]
#        SeqIO.write(seqobj,seqout_nontelo,"fasta")
        listout_nontelo.write(tip.name)
        listout_nontelo.write('\n')
        
#seqout_telo.close()
#seqout_nontelo.close()

listout_telo.close()
listout_nontelo.close()

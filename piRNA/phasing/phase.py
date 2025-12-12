import sys

fh5=open(sys.argv[1])
fh3=open(sys.argv[2])
ID=sys.argv[3]
desc=sys.argv[4]

howfar=20

list5=[]
list3=[]

alld={}

for line in fh5:
    line=line.rstrip()
    list5.append(int(line))
fh5.close()

for line in fh3:
    line=line.rstrip()
    list3.append(int(line))
fh3.close()

#initialize
dist = [0] * (list3[-1]+howfar+1)

for j in list5:
    dist[j+1]+=1 # add one to convert from 0-based to 1-based

for k in list3:
    distance=howfar
    num=0
    for m in range(k,k+howfar):
        if dist[m] != 0:
            distance=m-k
#            num=dist[m]
            num=1
            break
    if distance in alld:
        alld[distance]+=num
    else:
        alld[distance]=num

tot=sum(list(alld.values()))

for i in range(howfar):
    if i in alld:
        print(i,alld[i]/tot,ID,desc,sep="\t")
    else:
        print(i,0,ID,desc,sep="\t")

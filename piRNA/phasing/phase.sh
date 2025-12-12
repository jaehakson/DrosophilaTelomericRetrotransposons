#Daur all
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 2 > D.auraria_piwi.5p
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 3 > D.auraria_piwi.3p
python3 phase.py D.auraria_piwi.5p D.auraria_piwi.3p Daur All > phase.out

#Daur upstream
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+" && $3<=935' | cut -f 1-3 | uniq | cut -f 2 > D.auraria_piwi.5p
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+" && $3<=935' | cut -f 1-3 | uniq | cut -f 3 > D.auraria_piwi.3p
python3 phase.py D.auraria_piwi.5p D.auraria_piwi.3p Daur Upstream >> phase.out

#Daur downstream
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+" && $2>=1170' | cut -f 1-3 | uniq | cut -f 2 > D.auraria_piwi.5p
bedtools bamtobed -i D.auraria_piwi.bam | awk '$6=="+" && $2>=1170' | cut -f 1-3 | uniq | cut -f 3 > D.auraria_piwi.3p
python3 phase.py D.auraria_piwi.5p D.auraria_piwi.3p Daur Downstream >> phase.out

#Dtri all
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 2 > D.triauraria_piwi.5p
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 3 > D.triauraria_piwi.3p
python3 phase.py D.triauraria_piwi.5p D.triauraria_piwi.3p Dtri All >> phase.out

#Dtri upstream
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+" && $3<=934' | cut -f 1-3 | uniq | cut -f 2 > D.triauraria_piwi.5p
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+" && $3<=934' | cut -f 1-3 | uniq | cut -f 3 > D.triauraria_piwi.3p
python3 phase.py D.triauraria_piwi.5p D.triauraria_piwi.3p Dtri Upstream >> phase.out

#Dtri downstream
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+" && $2>=1167' | cut -f 1-3 | uniq | cut -f 2 > D.triauraria_piwi.5p
bedtools bamtobed -i D.triauraria_piwi.bam | awk '$6=="+" && $2>=1167' | cut -f 1-3 | uniq | cut -f 3 > D.triauraria_piwi.3p
python3 phase.py D.triauraria_piwi.5p D.triauraria_piwi.3p Dtri Downstream >> phase.out

#Zgab all
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 2 > Z.gabonicus_aub.5p
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 3 > Z.gabonicus_aub.3p
python3 phase.py Z.gabonicus_aub.5p Z.gabonicus_aub.3p Zgab All >> phase.out

#Zgab upstream
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+" && $3<=1381' | cut -f 1-3 | uniq | cut -f 2 > Z.gabonicus_aub.5p
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+" && $3<=1381' | cut -f 1-3 | uniq | cut -f 3 > Z.gabonicus_aub.3p
python3 phase.py Z.gabonicus_aub.5p Z.gabonicus_aub.3p Zgab Upstream >> phase.out

#Zgab downstream
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+" && $2>=1572' | cut -f 1-3 | uniq | cut -f 2 > Z.gabonicus_aub.5p
bedtools bamtobed -i Z.gabonicus_aub.bam | awk '$6=="+" && $2>=1572' | cut -f 1-3 | uniq | cut -f 3 > Z.gabonicus_aub.3p
python3 phase.py Z.gabonicus_aub.5p Z.gabonicus_aub.3p Zgab Downstream >> phase.out

#Zind all
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 2 > Z.indianus_aub.5p
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+"' | cut -f 1-3 | uniq | cut -f 3 > Z.indianus_aub.3p
python3 phase.py Z.indianus_aub.5p Z.indianus_aub.3p Zind All >> phase.out

#Zind upstream
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+" && $3<=1336' | cut -f 1-3 | uniq | cut -f 2 > Z.indianus_aub.5p
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+" && $3<=1336' | cut -f 1-3 | uniq | cut -f 3 > Z.indianus_aub.3p
python3 phase.py Z.indianus_aub.5p Z.indianus_aub.3p Zind Upstream >> phase.out

#Zind downstream
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+" && $2>=1572' | cut -f 1-3 | uniq | cut -f 2 > Z.indianus_aub.5p
bedtools bamtobed -i Z.indianus_aub.bam | awk '$6=="+" && $2>=1572' | cut -f 1-3 | uniq | cut -f 3 > Z.indianus_aub.3p
python3 phase.py Z.indianus_aub.5p Z.indianus_aub.3p Zind Downstream >> phase.out

#D.auraria piwi upstream (1-935)
#D.auraria piwi downstream (1170-2595)
#D.triauraria piwi upstream (1-934)
#D.triauraria piwi downstream (1167-2592)
#Z.gabonicus aub upstream (1-1381)
#Z.gabonicus aub downstream (1572-2595)
#Z.indianus_4605 aub upstream (1-1336)
#Z.indianus_4605 aub downstream (1527-2595)


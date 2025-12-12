library(tidyverse)
read.table("phase.out")->D
D <- D %>% mutate(v = 1L) 
ggplot(data=D,aes(x=V1,y=V2)) + geom_line() + facet_grid(D$V3~D$V4) + geom_vline(aes(xintercept =v),color="red",linetype="dashed",size=0.5) + ylab("Fraction piRNA pairs") + xlab("3'-to-5' distance")->p
ggsave("phasing.pdf",height=3.25,width=3.25)

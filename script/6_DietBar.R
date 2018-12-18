library(ggplot2)
library(plyr)
library(tidyverse)
library(ggpubr)

df=read.table("./data/blastOutput/all_classified.fastq")
colnames(df)=c("tag","sampleID","count","species","PercMatch","AmpliconLength","ReferenceLength","Mismatch","Evalue")
df2=df[,1:4]
head(df)
df3 <-
  df2 %>%
  group_by(tag,sampleID,species) %>%
  summarise(count=sum(count)) %>%
  as.data.frame
df3$species=sub("_"," ",df3$species)
df3$species=mapvalues(df3$species, 
              from=c("Catopuma badia","Cervus elaphus","Homo heidelbergensis","Odocoileus virginianus"),
              to=c("Puma concolor/Lynx rufus","Cervus canadensis","Homo sapiens","Odocoileus virginianus/Odocoileus hemionus"))

p1=ggplot(data=df3,aes(x=sampleID, y=count, fill=species))+
  geom_bar(stat="identity")+
  scale_y_continuous(expand = c(0, 0))+
  theme(
    axis.line = element_line(size = 0.5,colour = "black"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.x =element_blank(),
    legend.position="none")


df4=df3 %>% 
  group_by(tag,sampleID) %>% 
  mutate(percent=count/sum(count)) %>% 
  as.data.frame

  
p2=ggplot(data=df4,aes(x=sampleID, y=percent, fill=species))+
  geom_bar(stat="identity")+
  scale_y_continuous(expand = c(0, 0))+
  theme(
    axis.line = element_line(size = 0.5,colour = "black"), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.x =element_blank(),
    legend.position="none")

p=ggarrange(p1,p2,ncol=2, common.legend=TRUE, legend="bottom",labels=c("A","B "))
ggexport(p,filename="relativeAbundance.pdf",width = 10, height = 7)

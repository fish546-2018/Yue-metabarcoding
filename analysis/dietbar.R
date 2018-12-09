library(ggplot2)
diet=read.csv("./data/diet.csv")
p=ggplot(diet,aes(x=taxonomy,y=count, fill=taxonomy))+
  geom_bar(width=1, stat="identity")+
  facet_grid(extraction ~ sample)+
  theme_bw()+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())+
  scale_y_continuous(expand = c(0, 0))
ggsave("dietbar.pdf", plot=p)

library(ggplot2)

df <- data.frame(Anos=rep(c("2004", "2018"), each=3),
                 Países = rep(c("BG - Bulgária", "ES - Espanha", "FR - França"), 2), 
                 Resíduos = c(26.0, 3.7, 4.7, 18.5, 2.9, 5.1))

ggplot(data = df, aes(x=Países, y=Resíduos, fill=Anos)) +
  geom_bar(stat="identity", position=position_dodge(), color="black") + 
  geom_text(aes(label=Resíduos), vjust=1.6, color="white", position=position_dodge(0.9), size=3.5) +
  ggtitle("Resíduos per Capita") +
  ylab("Resíduos (tonelada - rácio)") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(values=c("#15BAC4", "#EEA616")) 

library(ggplot2)
library(readxl)

QualidadeARO3 <- read_excel("C:/Users/ASUS/Downloads/QualidadeARO3.xlsx", 
                            col_types = c("numeric", "text", "text", 
                                          "numeric", "numeric", "text", "text", 
                                          "numeric", "numeric", "numeric"))

Antas_Espinho = QualidadeARO3$`Antas-Espinho`
Ilhavo = QualidadeARO3$Ihavo

df <- data.frame("Estações"=rep(c("Antas-Espinho", "Ilhavo"), each =8784), 
                 "Valores"=c(Antas_Espinho, Ilhavo))

ggplot(data=df, aes(x=Valores, color=Estações, fill=Estações)) +
  geom_histogram(binwidth = 5, position = "identity", alpha=0.5) +
  labs(x="Valores (µg/m³)", y="Número de Instâncias", 
       title="Nível de Ozono (µg/m³)", subtitle="Antas-Espinho e Ilhavo em 2020") +
  scale_x_continuous(breaks=seq(0, 200, 25)) +
  scale_y_continuous(breaks=seq(0, 1000, 100))

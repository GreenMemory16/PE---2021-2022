library(ggplot2)
set.seed(2)

m <- 1000; n <- seq(100, 2500, 100); conf <- 0.96; q <- conf+(1-conf)/2
MA1 = matrix(25); MA2 = matrix(25)

for(i in 1:25) {
  set.seed(2)
  X1 = matrix(rexp(m*n[i], 0.91), ncol = n[i], byrow=TRUE)
  media1 = apply(X1, 1, mean)
  int.min1 = (1-qnorm(q)/sqrt(n[i]))/media1
  int.max1 = (1+qnorm(q)/sqrt(n[i]))/media1
  MA1[i] = mean(int.max1-int.min1)
  X2 = X1
  
  for(j in 1:m) {
    X2[j, sample(1:n[1], size=n[i], 0.10)] <- rexp(n[i]*0.10, 0.31)
  }
  
  media2 = apply(X2, 1, mean)
  int.min2 = (1-qnorm(q)/sqrt(n[i]))/media2
  int.max2 = (1+qnorm(q)/sqrt(n[i]))/media2
  MA2[i] = mean(int.max2-int.min2)

}

df <-data.frame("n"=rep(n, 2), "Amplitude"=c(MA1, MA2), "Contaminação"=rep(c("MA", "MAC"), each=25))

ggplot(data=df, aes(x=n, y=Amplitude, fill=Contaminação)) + 
  geom_bar(stat="identity", color="black", position=position_dodge2()) + theme() +
  scale_fill_manual(values=c("orange", "#24B6C6")) +
  scale_x_continuous(breaks=seq(0, 2500, 200), expand=c(0,0)) +
  scale_y_continuous(breaks=seq(0,0.5,0.05), expand=c(0,0)) +
  labs(x="n", y="Amplitude", title="Média da Amplitude para amostras de dimensão n",
       subtitle="1000 Amostras por cada de n com confiança = 0.96 e 10% Contaminados")

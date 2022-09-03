library(ggplot2)
library(patchwork)
set.seed(1103)

m <- 110;  n <- c(3, 24, 86);  medias <- list();  medias <- matrix(nrow=m, ncol=3)

for(i in 1:3) {
  set.seed(1103)
  matriz.amostras <- matrix(nrow=m, ncol=n[i])
  for(j in 1:m) {
    matriz.amostras[j,] <- runif(n[i], 9, 13); medias[j,i] <- mean(matriz.amostras[j,])
  }
}
df <- data.frame(v1=unlist(medias[,1], use.names = FALSE), v2=unlist(medias[,2], use.names = FALSE), v3=unlist(medias[,3], use.names = FALSE))

p1 <- ggplot(df, aes(v1)) + geom_histogram(aes(y=stat(density)),color="black", alpha=0.6, fill="orange", bins = 30) + 
  labs(x="Valores da Distribuição da Média", y="Frequência Relativa") + ggtitle("Distribuição da Média (n=3)") + xlim(9, 13) + theme(plot.title = element_text(hjust = 0.5)) + stat_function(fun=dnorm, args=list(mean=mean(df$v1), sd=sd(df$v1)))
p2 <- ggplot(df, aes(v2)) + geom_histogram(aes(y=stat(density)), color="black", alpha=0.6, fill="orange", bins = 40) +
  labs(x="Valores da Distribuição da Média", y="Frequência Relativa") + ggtitle("Distribuição da Média (n=24)") + xlim(9, 13) + theme(plot.title = element_text(hjust = 0.5)) + stat_function(fun=dnorm, args=list(mean=mean(df$v2), sd=sd(df$v2)))
p3 <- ggplot(df, aes(v3)) +  geom_histogram(aes(y=stat(density)), color="black", alpha=0.6, fill="orange", bins = 40) + 
  labs(x="Valores da Distribuição da Média", y="Frequência Relativa") + ggtitle("Distribuição da Média (n=86)") + xlim(9, 13) + theme(plot.title = element_text(hjust = 0.5)) + stat_function(fun=dnorm, args=list(mean=mean(df$v3), sd=sd(df$v3)))
p1 + p2 + p3

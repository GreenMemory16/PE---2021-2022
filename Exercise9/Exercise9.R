library(ggplot2)
set.seed(304); m <-950; n <- seq(100, 5000, 100); conf <- 0.97; q <- conf+(1-conf)/2
MAT = matrix(50)

for(i in 1:50) {
  set.seed(304)
  X = matrix(rexp(m*n[i], 2.4), ncol = n[i], byrow=TRUE)
  media = apply(X, 1, mean)
  int.min = (1-qnorm(q)/sqrt(n[i]))/media
  int.max = (1+qnorm(q)/sqrt(n[i]))/media
  MAT[i] = mean(int.max-int.min)
}

df <- data.frame(MAT, n)

ggplot(df, aes(x=n, y=MAT)) +
  geom_point(color="orange") + geom_line() +
  labs(x="n", y="MA(n)", title="Média da Amplitude de Intervalos de Confiança de nível 0.97 de Amostras de Dimensão n", 
       subtitle = "950 Amostras por cada valor de n", color="MA(n)") +
  theme_bw()

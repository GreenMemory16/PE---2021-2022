set.seed(519)
medias <- matrix(122)
matriz.amostras <- matrix(nrow = 4300, ncol = 122)

for(i in 1:4300) {
  matriz.amostras[i,] <- rbinom(122, 28, 0.08)
}

for(i in 1:4300) {
  medias[i] <- mean(matriz.amostras[i,])
}

v.esperado <- 28*0.08

format(round(abs(mean(medias) - v.esperado), 6), nsmall=6)

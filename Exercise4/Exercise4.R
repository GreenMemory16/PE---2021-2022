library(readxl)

Utentes <- read_excel("C:/Users/ASUS/Downloads/Utentes.xlsx")

Colesterol = Utentes$Colesterol
Idade = Utentes$Idade

plot(Colesterol, Idade, main="Gráfico de Dispersão Colesterol / Idade",
     xlab="Colesterol", ylab="Idade (anos)", pch=19, frame=FALSE)
abline(lm(Idade ~ Colesterol, data = mtcars), col="blue")

library(ggplot2)
library(readxl)

EsperancaVida <- read_excel("C:/Users/ASUS/Downloads/EsperancaVida.xlsx",range = "AJ9:CY70")

CY_H = EsperancaVida$`CY - Chipre...8`
CY_M = EsperancaVida$`CY - Chipre...42`
LT_H = EsperancaVida$`LT - Lituânia...22`
LT_M = EsperancaVida$`LT - Lituânia...56`
UK_H = EsperancaVida$`UK - Reino Unido...33`
UK_M = EsperancaVida$`UK - Reino Unido...67`

df <- data.frame("Ano"=c(rep(seq(2002,2019), 4), rep(seq(2002, 2018), 2)), 
                 "Valores"=c(CY_H[43:60], CY_M[43:60],
                             LT_H[43:60], LT_M[43:60], 
                             UK_H[43:59], UK_M[43:59]),
                 
                 "Países"=c(rep(c("CY-H", "CY-M", "LT-H", "LT-M"), each=18), 
                            rep(c("UK-H", "UK-M"), each=17)))

ggplot(data=df, aes(x=Ano, y=Valores)) + 
  geom_line(aes(color=Países), size=1.5) +
  labs(title="Esperança de Vida à Nascença", 
       subtitle="Chipre, Lituânia e Reino Unido entre 2002 e 2019") +
scale_x_continuous(limits=c(2002, 2019), breaks=seq(2002, 2019, by=2)) +
  scale_y_continuous(breaks=seq(60, 90, by=2)) +
  ylab("Esperança de Vida (Anos)") +
  scale_color_manual(values=c("#EA9C26", "#C17F1A", "#1ED1DB", 
                              "#258A95", "#E121EA", "#A81AAF"))

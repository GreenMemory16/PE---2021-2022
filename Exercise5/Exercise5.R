set.seed(572)

amostra <- rexp(181, 0.15)

F.emp <- ecdf(amostra)

prob.emp <- 1 - F.emp(9)

F.teo <- function(x) {
  1 - exp(-0.15*x)
}

prob.teo <- 1 - F.teo(9)

format(round(abs(prob.teo - prob.emp), 6), nsmall= 6)

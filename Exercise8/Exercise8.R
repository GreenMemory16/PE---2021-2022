set.seed(454)

conf=0.93
q = conf+(1-conf)/2

X = matrix(rexp(1050*848, 1.64), ncol = 848, byrow=TRUE)

media = apply(X, 1, mean)

int.min = (1-qnorm(q)/sqrt(848))/media
int.max = (1+qnorm(q)/sqrt(848))/media

mean(int.max-int.min)

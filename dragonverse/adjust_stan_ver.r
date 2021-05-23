#remove.packages(c("StanHeaders","rstan",'RcppEigen'))

install.packages("StanHeaders", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages("rstan", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
install.packages("brms")


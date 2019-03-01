data{
  int<lower=0> N;
  int Y[N];
}

parameters{
  real<lower=0,upper=1> theta;
}

model{
  for(n in 1:N){
    target += log_sum_exp(
      log(0.5) + bernoulli_lpmf(Y[n]|theta),
      log(0.5) + bernoulli_lpmf(Y[n]|1)
    );
  }
}

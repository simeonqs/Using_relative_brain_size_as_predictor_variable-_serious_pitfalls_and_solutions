// On the use of relative brain size
// Simeon Q. Smeele
// Started: 03-03-2022
// Last modified: 08-04-2022
// Description: Stan code for the Bayesian linear model with brain size as
// predictor variable. For more explanation of the Stan structure see the 
// the sem.stan file.
// This version of the model has more informative priors. 

data {
  int<lower=0> N;
  vector[N] brain_size;
  vector[N] body_size;
  vector[N] z;
}

parameters {
  real a;
  real<lower=0> b_body;
  real<lower=0> b_brain;
  real<lower=0> sigma;
}

model {
  a ~ normal(0, 0.25);
  b_brain ~ exponential(1);
  b_body ~ exponential(1);
  sigma ~ exponential(1);
  z ~ normal(a + b_body * body_size + b_brain * brain_size, sigma);
}

// On the use of relative brain size
// Simeon Q. Smeele
// Started: 03-03-2022
// Last modified: 06-03-2022
// Description: Stan code for the Bayesian linear model with brain size as
// response variable. For more explanation of the Stan structure see the
// the sem.stan file.

data {
  int<lower=0> N;
  vector[N] brain_size;
  vector[N] body_size;
  vector[N] z;
}

parameters {
  real a;
  real b_body;
  real b_z;
  real<lower=0> sigma;
}

model {
  a ~ normal(0, 1);
  b_body ~ normal(0, 1);
  b_z ~ normal(0, 1);
  sigma ~ exponential(1);
  brain_size ~ normal(a + b_body * body_size + b_z * z, sigma);
}

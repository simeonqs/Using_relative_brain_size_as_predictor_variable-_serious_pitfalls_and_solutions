// On the use of relative brain size
// Simeon Q. Smeele
// Started: 03-03-2022
// Last modified: 08-04-2022
// Description: Stan code for the Bayesian structural equation model. Notes
// are written with '//' in front.
// This version of the model has more informative priors. 

// Data section: here all variables and their structure are declared
data {
  int<lower=0> N; // sample size, is positive integer
  vector[N] brain_size; // brain size, is vector of size N
  vector[N] body_size; // body size, is vector of size N
  vector[N] z; // z, is vector of size N
}

// Parameter section: here all parameters of the model and their structure
// are declared
parameters {
  real a_body; // mean body size, real number
  real a_brain; // mean brain size, real number
  real a_z; // mean z, real number
  real<lower=0> b_body_brain; // slope (effect) from body on brain, real number
  real<lower=0> b_body_z; // slope from body on z, real number
  real<lower=0> b_brain_z; // slope from brain on z, real number
  real<lower=0> sigma_body; // standard deviation body size, positive real number
  real<lower=0> sigma_brain; // standard deviation brain size, positive real number
  real<lower=0> sigma_z; // standard deviation z, positive real number
}

// Model section: here all intermediate parameters are declared, priors are defined and sub-models are run
model {
  // Intermediate parameters
  vector[N] mu_brain;
  vector[N] mu_z;
  // Priors
  a_body ~ normal(0, 0.25);
  a_brain ~ normal(0, 0.25);
  a_z ~ normal(0, 0.25);
  b_body_brain ~ exponential(1);
  b_body_z ~ exponential(1);
  b_brain_z ~ exponential(1);
  sigma_body ~ exponential(1);
  sigma_brain ~ exponential(1);
  sigma_z ~ exponential(1);
  // Body size model
  // Body size is just a function of the average body size, so no need for an explicite loop.
  body_size ~ normal(a_body, sigma_body);
  // Brain size model
  // Each value of brain size (i = 1:N) is a function of the average (a_brain) and the effect of body size.
  for(i in 1:N) mu_brain[i] = a_brain + b_body_brain * body_size[i];
  brain_size ~ normal(mu_brain, sigma_brain);
  // z model
  // Each value of z (i = 1:N) is a function of the average (a_z) and the effect of body size and brain size.
  // The brain size effect is for relative brain size where brain_size[i] is the absolute brain size from 
  // the data and mu_brain[i] is the expected brain size from the brain size model.
  for(i in 1:N) mu_z[i] = a_z + b_body_z * body_size[i] + b_brain_z * (brain_size[i] - mu_brain[i]);
  z ~ normal(mu_z, sigma_z);
}
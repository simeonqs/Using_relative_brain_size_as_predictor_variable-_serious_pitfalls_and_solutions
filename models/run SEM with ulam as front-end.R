# Settings
library(rethinking)
set.seed(1)
N = 100
brain_effect = 1
body_effect = 1

# Simulate data
body_size = rnorm(N, 0, 1)
rel_brain_size = rnorm(N, 0, 1)
brain_size = 1 * body_size + rel_brain_size
mu_z = body_effect * body_size + brain_effect * rel_brain_size
z = rnorm(N, mu_z, 1)

# Run Bayesian SEM using ulam from rethinking as front-end
bay_sem_fit = ulam(alist(
  
  z ~ normal(mu_z, sigma_z), # z model
  mu_z <- a_z + g_body * body_size + g_brain * (brain_size - mu_brain[i]),
  
  brain_size ~ normal(mu_brain, sigma_brain), # brain size model
  mu_brain <- a_brain + b_body * body_size,
  
  body_size ~ normal(a_body, sigma_body), # body size model
  
  c(a_body, a_brain, a_z) ~ normal(0, 1),
  c(b_body, g_body, g_brain) ~ normal(0, 1),
  c(sigma_body, sigma_brain, sigma_z) ~ exponential(1)
  
), dat = list(body_size = body_size, brain_size = brain_size, z = z), # provide data as df or list
chains = 4, cores = 4, iter = 2000, warmup = 500, cmdstan = TRUE) # settings for sampling

print(precis(bay_sem_fit)) # print summary of results

post_sem_fit = extract.samples(bay_sem_fit) # extract samples from the posterior

# The post_sem_fit object has the same structure as the object in the main markdown and can also 
# be plotted using the same code. 

# The Stan-code can also be printed using the following line:
stancode(bay_sem_fit)

# For debugging the option sample = FALSE can be added to the ulam function so that Stan-code can be printed
# even for models that fail. 
# Overview

This repo is associated with the following article: 

```
Smeele, Simeon Q. "On the use of relative brain size." bioRxiv (2022).
```

All results can be reproduced by running *manuscript.Rmd*. This rmarkdown contains all R code to generate and analyse the data. The *.stan* files contain the model definitions for the Bayesian models. The files without extension are the already compiled models and can be used to speed up fitting (these are loaded automatically when the rmarkdown is run).

**Note:** I'm currently revising the manuscript for resubmission. An updated repo with complete file overview will be online soon.

------------------------------------------------

# Requirements

To run the Bayesian models *Stan* needs to be installed. This is not an R package, but *Stan* can be run from R. For installation see: https://mc-stan.org/users/interfaces/. 

The R code requires two libraries: *cmdstanr* to run the Stan engine and *scales* for transparent colours. Both can be installed from CRAN. To finish installing *cmdstanr* see: https://mc-stan.org/cmdstanr/. 

All models can be run within seconds on a normal PC. The compilation of the Bayesian models might take up to a minute the first time code is run, unless the compiled models are also downloaded. Models run on 4 threads. If your computer has less computing power, models can also be run on a single thread. For this change the *parallel_chains* setting for all fitting calls in the markdown. 

------------------------------------------------

# Session info

R version 4.1.0 (2021-05-18) 

Platform: x86_64-apple-darwin17.0 (64-bit)

Running under: macOS Catalina 10.15.7

Packages: scales_1.1.1, cmdstanr_0.4.0

------------------------------------------------

# Maintainers and contact

Please contact Simeon Q. Smeele, <ssmeele@ab.mpg.de>, if you have any questions or suggestions. 


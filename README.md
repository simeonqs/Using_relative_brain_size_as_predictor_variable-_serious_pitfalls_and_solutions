# Overview

This repo is associated with the following article: 

```
Smeele, Simeon Q. "Using relative brain size as predictor variable: serious pitfalls and solutions." bioRxiv (2022).
```
Previous title was: `On the use of relative brain size`.

All results can be reproduced by running **manuscript.Rmd**. This rmarkdown contains all R code to generate and analyse the data. 

------------------------------------------------

# Requirements

To run the Bayesian models *Stan* needs to be installed. This is not an R package, but *Stan* can be run from R. For installation see: https://mc-stan.org/users/interfaces/. 

The R code requires two libraries: *cmdstanr* to run the Stan engine and *scales* for transparent colours. Both can be installed from CRAN. To finish installing *cmdstanr* see: https://mc-stan.org/cmdstanr/. 

All models can be run within seconds on a normal PC. The compilation of the Bayesian models might take up to a minute the first time code is run, unless the compiled models are also downloaded. Models run on 4 threads. If your computer has less computing power, models can also be run on a single thread. For this change the *parallel_chains* setting for all fitting calls in the markdown. 

------------------------------------------------

# Meta data

- figures/DAG.key: Keynote version of Figure 1
- figures/DAG.pdf: pdf version of Figure 1
- figures/predictor.pdf: pdf version of Figure 3
- figures/response.pdf: pdf version of Figure 2

- models/run SEM with ulam as front-end.R: code to run structural equation model with ulam as front-end
- models/predictor: compiled Stan model
- models/predictor.stan: Stan code for Bayesian linear model of Case II
- models/response: compiled Stan model
- models/response.stan: Stan code for the Bayesian linear model of Case I
- models/sem: compiled Stan model
- models/sem.stan: Stan code for the structural equation model of Case II

- supplemental figures/predictor 1000.pdf: pdf of the results for relative brain size as predictor variable with a sample size of 1000
- supplemental figures/predictor 20.pdf: pdf of the results for relative brain size as predictor variable with a sample size of 20
- supplemental figures/predictor informative.pdf: pdf of the results for relative brain size as predictor variable with informative priors
- supplemental figures/predictor strong brain.pdf: pdf of the results with a strong brain size effect
supplemental figures/predictor strong body.pdf: pdf of the results with a strong body size effect
- supplemental figures/predictor vague.pdf: pdf of the results for relative brain size as predictor variable with vague priors
- supplemental figures/response 1000.pdf: pdf of the results for relative brain size as response variable with a sample size of 1000
- supplemental figures/response case iii.pdf: pdf of the results for relative brain size as response variable with an additional path from body to *z*
- supplemental figures/response 20.pdf: pdf of the results for relative brain size as response variable with a sample size of 20
- supplemental figures/response informative.pdf: pdf of the results for relative brain size as response variable with informative priors
- supplemental figures/response vague.pdf: pdf of the results for relative brain size as response variable with vague priors

- supplemental models/predictor_informative: compiled Stan model
- supplemental models/predictor_informative.stan: Stan code for Bayesian model of Case II with informative priors
- supplemental models/predictor_vague: compiled Stan model
- supplemental models/predictor_vague.stan: Stan code for Bayesian model of Case II with vague priors
- supplemental models/response_informative: compiled Stan model
- supplemental models/response_informative.stan: Stan code for Bayesian model of Case I with informative priors
- supplemental models/response_vague: compiled Stan model
- supplemental models/response_vague.stan: Stan code for Bayesian model of Case I with vague priors
- supplemental models/sem_informative: compiled Stan model
- supplemental models/sem_informative.stan: Stan code for the structural equation model of Case II with informative priors
- supplemental models/sem_vague: compiled Stan model
- supplemental models/sem_vague.stan: Stan code for the structural equation model of Case II with vague priors

- .gitignore: file that tells Git which files should not be tracked
- Using_relative_brain_size_as_predictor_variable-_serious_pitfalls_and_solutions.Rproj: R project file, if code is opened from this project the working directory is set automatically
- README.md: markdown file with all information for this repository
- bibliography.bib: BibTex file with all references
- manuscript.Rmd: Rmarkdown file to compile the manuscript, including generating data and results, includes the Appendix with supplemental methods and results
- manuscript.pdf: pdf version of the main text

------------------------------------------------

# Session info

R version 4.1.0 (2021-05-18)

Platform: x86_64-apple-darwin17.0 (64-bit)

Running under: macOS Catalina 10.15.7

Packages: scales_1.1.1, cmdstanr_0.4.0

------------------------------------------------

# Maintainers and contact

Please contact Simeon Q. Smeele, <ssmeele@ab.mpg.de>, if you have any questions or suggestions. 


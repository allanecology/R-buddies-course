# # # # # # # # # # # # # # # #
#                             #
# CREATING EXAMPLE DATASETS
#                             #
# # # # # # # # # # # # # # # #

# Aim : creating or loading example datasets


# PLANTSPECIES ----
# create an example dataset "plantspecies"
landuse_gradient = sample(seq(1, 3, 0.1), 100, replace = T)
plantspecies <- data.frame(plotID = as.factor(seq(1, 100, 1)),
                           landuse_gradient = sample(seq(1, 3, 0.1), 100, replace = T),
                           plottaria_exampulus = 0.5*landuse_gradient + 12 + rnorm(100, mean = 12/2, sd = 12/0.5),
                           graphica_demonstrandi = 0.5*landuse_gradient + 8 + rnorm(100, mean = 8/2, sd = 8/1),
                           arrclubus_cursus = 0.5*landuse_gradient + 25 + rnorm(100, mean = 25/2, sd = 25/2),
                           exemplaria_plotii = 0.5*landuse_gradient + 9 + rnorm(100, mean = 9/2, sd = 9/0.8))
rm(landuse_gradient)
head(plantspecies)


# MISSING DATA ----


# VEGAN ----
#
# see at : https://cran.r-project.org/web/packages/vegan/vegan.pdf
#
# varespec
# estimated cover of 44 plant species, 24 rows (sites)
library(vegan)
data(varespec)
#
# varechem
# 14 columns of soil characteristics, 24 rows (sites)
# Baresoil gives the estimated cover of bare soil, Humdepth the thickness of the humus layer.
#
# mite
# 35 oribatid mite species counts in 70 soil cores (rows)

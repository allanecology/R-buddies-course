############################
#### Data transformation ####
#############################

### Author: Noëlle Schenk

### Purpose of script:
# Because you specify columns and not rows in ggplot2, your data has to be in the long format. 
# Data is often collected in the wide format and has to be transformed to long format before plotting. 
# For instance, if people do vegetation records, most of the time species are in rows and abundances in columns. 
# If you use your own data for this tutorial, check the format and eventually transform your data with the following code.

require(reshape2)
library(ggplot2)

# create an example dataset "plantspecies"
plantspecies <- data.frame(plotID = as.factor(seq(1, 100, 1)),
                           landuse_gradient = sample(seq(1, 3, 0.1), 100, replace = T),
                           plottaria_exampulus = 0.5*landuse_gradient + 12 + rnorm(100, mean = 12/2, sd = 12/0.5),
                           graphica_demonstrandi = 0.5*landuse_gradient + 8 + rnorm(100, mean = 8/2, sd = 8/1),
                           arrclubus_cursus = 0.5*landuse_gradient + 25 + rnorm(100, mean = 25/2, sd = 25/2),
                           exemplaria_plotii = 0.5*landuse_gradient + 9 + rnorm(100, mean = 9/2, sd = 9/0.8))
head(plantspecies)


# only possible to plot 1 plant species at a time
ggplot(plantspecies, aes(x = landuse_gradient, y = plottaria_exampulus)) +
  geom_point()

# bring to ggplot format, using the package reshape2
plantspecies_long <- melt(plantspecies,
                          id.vars = c("plotID", "landuse_gradient"),
                          measure.vars = c("plottaria_exampulus", "graphica_demonstrandi", "arrclubus_cursus", "exemplaria_plotii"),
                          value.name = "Abundance",
                          variable.name = "Species")
# minimal example
melt(plantspecies, id.vars = c("plotID", "landuse_gradient"))
# all the other parameters are guessed from the input = the function knows itself what to do
# if you just tell it which columns need to stay.

ggplot(plantspecies_long, aes(x = Species, y = Abundance)) +
  geom_boxplot() +
  geom_point()
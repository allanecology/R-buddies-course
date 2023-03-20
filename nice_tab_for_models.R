install.packages("sjPlot")
library(sjPlot)
# alternative : stargazer
data("iris")
mod1 <- lm(Sepal.Length ~ Sepal.Width + Species, data = iris)
mod2 <- lm(Sepal.Width ~ Petal.Width + Species, data = iris)

# default results
summary(mod1)
summary(mod2)

# pretty results
tab_model(mod1, mod2)

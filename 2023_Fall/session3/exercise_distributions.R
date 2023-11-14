# Session 3 -- exercise 1 -- Distribution

#load the data
data<-OrchardSprays

#load the package
library("univariateML")
#if it doesn't work on CRAN, you can use the devtool package
# install.packages("devtools")
#and install it from gitHub directly
devtools::install_github("JonasMoss/univariateML")

#let's try the log transformation
log_data<-data
log_data$decrease<-log(data$decrease)

#let's try the square root
sqrt_data<-data
sqrt_data$decrease<-sqrt(data$decrease)

hist(log_data$decrease)
hist(sqrt_data$decrease)
hist(data$decrease)

par(mfrow=c(1,2))
qqmlplot(sqrt_data$decrease, mlnorm, datax=T, main = "Sqrt transformation")
qqmlpoints(sqrt_data$decrease, mlnorm, datax = T, col="green")
qqmlline(sqrt_data$decrease, mlnorm, data=T, col="green")

qqmlplot(log_data$decrease, mlnorm, datax=T, main = "Log transformation")
qqmlpoints(log_data$decrease, mlnorm,datax=T, col ="red")
qqmlline(log_data$decrease, mlnorm, data=T, col="red")

AIC(mlnorm(log_data$decrease),
    mlnorm(sqrt_data$decrease))

hist(log_data$decrease, freq = F, main = "Log transformation")
lines(mlnorm(log_data$decrease), lwd = 2, col = "red")
rug(log_data$decrease)

hist(sqrt_data$decrease, freq = F, main = "Sqrt transformation")
lines(mlnorm(sqrt_data$decrease), lwd = 2, col = "green")
rug(sqrt_data$decrease)

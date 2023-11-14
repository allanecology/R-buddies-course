#Session 3 -- exercise 2 -- Loop

#load the data
data<-OrchardSprays

#load library
library(ggplot2)

data$treatment<-NULL
result_data<-matrix(NA, 8, 8)

for (x in 1:nrow(data)){
  i<-data$rowpos[x]
  j<-data$colpos[x]
  
  result_data[i,j]<-data$decrease[x]
}


p <- ggplot(data, aes(x=rowpos, y=colpos))+
  geom_raster(aes(fill=decrease))+
  scale_fill_gradient(high = "purple",
                      low = "white")

p

library(data.table)
alternative<-data.table::dcast(data, rowpos~colpos, value.var="decrease")
alternative$rowpos<-NULL

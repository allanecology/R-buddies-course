#exercise data wrangling
#load the library
library(tidyverse)
library(ggplot2)

#read the table
#not working
data<-read.table("example_data_to_clean2.txt", sep="\t")
#working but adds a row
data<-read.delim("example_data_to_clean.txt",
                 row.names=NULL,
                 header = F)
#dplyr solution
corr.data<-data %>%
  mutate(V4=replace(V4, V1=="264",4)) %>%
  select(-V1) %>%
  filter(V2!="")

#base R solution
corr.data2<-data
corr.data2[corr.data2$V1=="264",]$V4<-"4"
useful.col.names<-corr.data2[1,]
useful.col.names<-as.character(c(useful.col.names))[1:3]
corr.data2$V1<-NULL
colnames(corr.data2)<-useful.col.names
corr.data2<-corr.data2[-1,]

#excluding the empty row n=265
corr.data2<-corr.data2[-(which(corr.data2$x==""&
                         corr.data2$y==""&
                         corr.data2$category=="")),]

#where are NAs?
rownames(corr.data2)<-NULL
which(is.na(corr.data2$x))

#remove the NAs
corr.data2.no.na<-na.omit(corr.data2)
rownames(corr.data2.no.na)<-NULL

#check the dataset
str(corr.data2.no.na)

#remove the commas from x
corr.data2.no.na$x.corr<-gsub(",",".",corr.data2.no.na$x)

#make numeric variables numeric
corr.data2.no.na$x.corr<-as.numeric(corr.data2.no.na$x.corr)
corr.data2.no.na$y<-as.numeric(corr.data2.no.na$y)

#check if category is consistent --- it's not it has mistakes
unique(corr.data2.no.na$category)
#select the mistakes and replace them
corr.data2.no.na[grepl("ne",corr.data2.no.na$category),]$category<-"1"
#the mistakes are now solved
unique(corr.data2.no.na$category)

#making category a factor
corr.data2.no.na$category<-as.factor(as.numeric(corr.data2.no.na$category))
str(corr.data2.no.na)

#subset category 1 and plot it
subset.data<-subset(corr.data2.no.na, 
                    corr.data2.no.na$category==1)
plot2<-ggplot(data=subset.data, aes(x=x.corr, y=y))+
  geom_point(color="red")
plot2

#plot all categories together
plot1<-ggplot(data=corr.data2.no.na, aes(x=x.corr, y=y))+
  facet_grid(~category)+
  geom_point(color="red")

plot1

#Loads the data into global variables
data_covid<-read.csv("owid-covid-data.csv")
#Keeps only the columns of interest
data_covid<-data_covid[data_covid$location=="Mexico",c(3,4,5,6,9)]
#Converts from factor to date
data_covid$date_case<-as.Date(data_covid$date_case)
typeDict<-c("p", "l", "h")
names(typeDict)<-c("Points", "Lines", "Bars")
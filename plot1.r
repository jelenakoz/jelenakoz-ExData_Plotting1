#read first 5 rows to extract column names
tab5rows <- read.table("household_power_consumption.txt", sep=";",header = TRUE, nrows = 5)

#read data
imena<-colnames(tab5rows)
dataSet <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,col.names=imena, ,skip=66637, nrows = 2880)


#Create plot
hist(dataSet[,3],col="red",xlab="Global Active Power (kilowatts)",main="Global Active power")

#Copy plot into the png file
dev.copy(png, file = "plot1.png",width = 480, height = 480) 
dev.off()

#read first 5 rows to extract column names
tab5rows <- read.table("household_power_consumption.txt", sep=";",header = TRUE, nrows = 5)

#read data
imena<-colnames(tab5rows)
dataSet <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,col.names=imena, ,skip=66637, nrows = 2880)


#Create plot
plot(as.numeric(dataSet[,3]),type="l",xlab="",xaxt="n",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

#Copy plot into the png file
dev.copy(png, file = "plot2.png",width = 480, height = 480) 
dev.off()

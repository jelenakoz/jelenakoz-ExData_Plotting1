#Read first 5 rows to extract column names
tab5rows <- read.table("household_power_consumption.txt", sep=";",header = TRUE, nrows = 5)

#Read data
imena<-colnames(tab5rows)
dataSet <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,col.names=imena, ,skip=66637, nrows = 2880)

windows(width=480, height=480)
#cetvrti
par(mfrow = c(2, 2))
plot(as.numeric(dataSet[,3]),type="l",xlab="",xaxt="n",ylab="Global Active Power (kilowatts)")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(as.numeric(dataSet[,5]),type="l",xlab="datetime",xaxt="n",ylab="Voltage")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(as.numeric(dataSet[,7]),type = "l",ylab="Energy sub matering",xlab="",xaxt="n")
par(new=TRUE)
plot(as.numeric(dataSet[,8]),type = "l",ylim=range(as.numeric(dataSet[,7])),ylab="",yaxt="n",xlab="",xaxt="n",col="red")
par(new=TRUE)
plot(as.numeric(dataSet[,9]),type = "l",ylab="",ylim=range(as.numeric(dataSet[,7])),yaxt="n",xlab="",xaxt="n",col="blue")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",legend=colnames(dataSet)[7:9],bty="n",lty=1,col=c("black","blue","red"),cex=0.8)

plot(as.numeric(dataSet[,4]),type="l",xaxt="n",ylab="Global_reactive_power",xlab="datetime")
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))


#Copy plot into the png file
dev.copy(png, file = "plot4.png",width = 480, height = 480) 
dev.off()

#Read first 5 rows to extract column names
tab5rows <- read.table("household_power_consumption.txt", sep=";",header = TRUE, nrows = 5)


#Read data
imena<-colnames(tab5rows)
dataSet <- read.table("household_power_consumption.txt",sep=";",as.is=TRUE,col.names=imena, ,skip=66637, nrows = 2880)


windows(width=480, height=480)
#Create plot
plot(as.numeric(dataSet[,7]),type = "l",
     ylab="Energy sub matering",xlab="",xaxt="n")

par(new=TRUE)
plot(as.numeric(dataSet[,8]),type = "l",
     ylim=range(as.numeric(dataSet[,7])),ylab="",
     yaxt="n",xlab="",xaxt="n",col="red")

par(new=TRUE)
plot(as.numeric(dataSet[,9]),type = "l",ylab="",
     ylim=range(as.numeric(dataSet[,7])),yaxt="n",
     xlab="",xaxt="n",col="blue")

axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",legend=colnames(dataSet)[7:9],
       lty=1,col=c("black","blue","red"),cex=0.9)


#Copy plot into the png file
dev.copy(png, file = "plot3.png",width = 480, height = 480) 
dev.off()

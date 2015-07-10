data<-read.csv("household_power_consumption.txt",sep=";",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F)

data$Date<-strptime(as.character(data$V1),"%d/%m/%Y")

data$DateTime<-as.POSIXct(paste(data$Date,data$V2),format="%Y-%m-%d %H:%M:%S")

par(bg="white")
plot(data$V7 ~ data$DateTime,ylab="Energy sub metering",xlab="",type="l")
lines(data$V8 ~ data$DateTime,type="l",col="red")
lines(data$V9 ~ data$DateTime,type="l",col="blue")
legend("topright",lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()

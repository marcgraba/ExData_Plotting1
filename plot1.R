data<-read.csv("household_power_consumption.txt",sep=";",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F)

par(bg="white")
hist(data$V3,col="red",xlab="Global Active Power (KWh)",main="Global Active Power")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
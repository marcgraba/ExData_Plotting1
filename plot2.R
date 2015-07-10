data<-read.csv("household_power_consumption.txt",sep=";",skip=grep("31/1/2007;23:59:00",readLines("household_power_consumption.txt")),nrows=2880,header=F)

data$Date<-strptime(as.character(data$V1),"%d/%m/%Y")

data$DateTime<-as.POSIXct(paste(data$Date,data$V2),format="%Y-%m-%d %H:%M:%S")

par(bg="white")
plot(data$V3 ~ data$DateTime,ylab="Global Active Power (KWh)",xlab="",type="l")

dev.copy(png,"plot2.png", width=400, height=400)
dev.off()
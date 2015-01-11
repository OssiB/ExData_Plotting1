setwd("~/Downloads")
library(sqldf)

filtered <- read.csv.sql("household_power_consumption.txt",sql = "select * from file where Date='1/2/2007" or Date='2/2/2007'"", header = TRUE, sep = ";")
filtered$DateTime <- as.POSIXct(paste(filtered$Date,filtered$Time), format="%d/%m/%Y %H:%M:%S")

png("plot4.png",height = 480,width= 480)

par(mfrow = c(2, 2), mar = c(2, 2, 2, 2))
plot(filtered$DateTime,filtered$Global_active_power,type="n",ylab="Global active power",xlab="")
lines(filtered$DateTime,filtered$Global_active_power)

plot(filtered$DateTime,filtered$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(filtered$DateTime,filtered$Voltage)


plot(filtered$DateTime,filtered$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(filtered$DateTime,filtered$Sub_metering_1,col="black")
lines(filtered$DateTime,filtered$Sub_metering_2,col="red")
lines(filtered$DateTime,filtered$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty = "n")

plot(filtered$DateTime,filtered$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(filtered$DateTime,filtered$Global_reactive_power,col="black")

dev.off()

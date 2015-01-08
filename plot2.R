setwd("~/Downloads")
library(sqldf)

filtered <- read.csv.sql("household_power_consumption.txt",sql = "select * from file where Date='1/2/2007" or Date='2/2/2007'"", header = TRUE, sep = ";")
png("plot1.png",height = 480,units ="px",width=480)
hist(filtered$Global_active_power,col="red",main = "Global active power",xlab = "Global active power(kilowatts)",ylim  = c(0,1200))
dev.off()

setwd("~/Downloads")
library(sqldf)

filtered <- read.csv.sql("household_power_consumption.txt",sql = "select * from file where Date='1/2/2007" or Date='2/2/2007'"", header = TRUE, sep = ";")

filtered$DateTime <- as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S") 

png("R1.png",height = 480,units ="px",width=480)
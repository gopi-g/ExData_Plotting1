library(data.table)
data <- fread("household_power_consumption.txt",showProgress=TRUE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
data1$Date <- as.Date(data1$Date,"%d/%m/%Y")
data1$Time <- strptime(data1$Time,"%H:%M:%S")
data1$date_time <- as.POSIXct(paste(data1$Date,data1$Time))
dateTime <- data1$date_time
plot(dateTime,as.numeric(data1$Sub_metering_1),type = "n",xlab ="",ylab = "Energy Sub metering")
lines(dateTime,as.numeric(data1$Sub_metering_1))
lines(dateTime,as.numeric(data1$Sub_metering_2),col="red")
lines(dateTime,as.numeric(data1$Sub_metering_3),col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black", "red", "blue") )
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()

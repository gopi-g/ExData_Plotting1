library(data.table)
data <- fread("household_power_consumption.txt",showProgress=TRUE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
data1$Date <- as.Date(data1$Date,"%d/%m/%Y")
data1$Time <- strptime(data1$Time,"%H:%M:%S")
data1$date_time <- as.POSIXct(paste(data1$Date,data1$Time))
plot(data1$date_time,as.numeric(data1$Global_active_power),type = "l",xlab="",ylab = "Global Active Power (kilowwatts)")
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()

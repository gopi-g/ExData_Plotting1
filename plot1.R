library(data.table)
data <- fread("household_power_consumption.txt",showProgress=TRUE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
hist(as.numeric(data1$Global_active_power),xlab = "Global Active Power (kilowwatts)",ylab="Frequency",main = "Global Active Power",col = "red")
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()
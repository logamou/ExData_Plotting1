# Loading Data 2 saved through Plot1.R
Data2 <- read.table("Data2.txt", header = T)

Data2$datetime=as.POSIXct(paste(Data2$Date, Data2$Time))

plot(Data2$datetime, Data2$Global_active_power, type="l", xlab="", ylab="Global Active Data2 (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

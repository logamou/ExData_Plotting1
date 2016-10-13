# Loading Data 2 saved through Plot1.R
Data2 <- read.table("Data2.txt", header = TRUE)

# Combining date and time
Data2$datetime=as.POSIXct(paste(Data2$Date, Data2$Time))

# Bulding the graphic
plot(Data2$datetime, Data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data2$datetime,Data2$Sub_metering_2,col="red")
lines(Data2$datetime,Data2$Sub_metering_3,col="blue")

# Adding the legend
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = c(1,1), cex = 0.5)

# Saving the graphic
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
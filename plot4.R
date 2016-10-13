  # Loading Data 2 saved through Plot1.R
  Data2 <- read.table("Data2.txt", header = TRUE)
  
  par(mfrow = c(2,2))
  
  # Plot 1/4
  # Loading Data 2 saved through Plot1.R
  Data2$datetime=as.POSIXct(paste(Data2$Date, Data2$Time))
  plot(Data2$datetime, Data2$Global_active_power, type="l", xlab="", ylab="Global Active Data2 (kilowatts)")
  
  # Plot 2/4
  plot(Data2$datetime, Data2$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  # Plot 3/4
  
  # Bulding the graphic
  plot(Data2$datetime, Data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Data2$datetime,Data2$Sub_metering_2,col="red")
  lines(Data2$datetime,Data2$Sub_metering_3,col="blue")
  
  # Adding the legend
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty = c(1,1), cex = 0.5, bty = "n", y.intersp = 0.2)
 
  # plot 4/4
  plot(Data2$datetime, Data2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  # Saving plot4
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
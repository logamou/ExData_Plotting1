# !!! Click on plot1.R to directly set the work directory which will run the code without error
# Checking whether the file we're suppose to download exists in the work directory. Otherwise
# it'll be downloaded
if(!file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")){
  filelink <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(filelink, destfile = paste(getwd(),"exdata%2Fdata%2Fhousehold_power_consumption.zip", sep = "/"))
  unzipped <- unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
} else {
  unzipped <- unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
}

## Loading data
Data <- read.table(unzipped, header = TRUE, sep = ";")

## Rough estimate of how much memory the dataset will require in memory 
Memory <- nrow(Data) * ncol(Data) * 8/2^20
cat("Estimated memory for this data set is :", Memory, " MB\n")

## Convertion of the Date column to Date class
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
  
## Indexes of rows corresponding to dates to take into account
ids.Date <- which(Data$Date == "2007-02-01" | Data$Date=="2007-02-02")
  
## Extraction of the Global_active_power and conversion into numeric class
## because str has showed it to be a factor variable
Data2 <- Data[ids.Date, ]
GAP <- as.numeric(Data2$Global_active_power)
## Hisogram of GAP as seen on Peer-graded Assignment: Course Project 1
hist(GAP, main = paste("Global Active Power"), xlab="Global Active Power (kilowatts)", col="red")
  
## Saving the PNG file as required
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

# Saving our Data2 for further use
write.table(Data2, "Data2.txt", row.names = FALSE)

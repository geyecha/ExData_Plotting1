library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#draw the plot
png("plot1.png", width=480, height=480)
hist(as.numeric(TwoDay$Global_active_power),
     main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
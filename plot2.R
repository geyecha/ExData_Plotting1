library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#extract the date and time information
dates<-paste(TwoDay$Date,TwoDay$Time)
datetime<- strptime(dates, "%d/%m/%Y %H:%M:%S")

#draw 2nd plot
png("plot2.png", width=480, height=480)
plot(datetime,TwoDay$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()

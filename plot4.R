library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#extract the date and time information
dates<-paste(TwoDay$Date,TwoDay$Time)
datetime<- strptime(dates, "%d/%m/%Y %H:%M:%S")

#draw the Plot 4 with 4 small plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#plot(1,1)
plot(datetime,TwoDay$Global_active_power, ylab="Global Active Power", xlab="", type="l")

#plot(1,2)
plot(datetime,TwoDay$Voltage, xlab="datatime",main=NULL, ylab="Voltage",type="l")

#plot(2,1)
plot(datetime,TwoDay$Sub_metering_1, ylab="Energy sub metering",
        main=NULL, xlab="",type="l")
lines(datetime,TwoDay$Sub_metering_2, col="red", xlab="")
lines(datetime,TwoDay$Sub_metering_3, col="blue", xlab="")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=1, col=c("black","red","blue"))

#plot(2,2)
plot(datetime,TwoDay$Global_reactive_power, xlab="datatime", main=NULL, ylab="Global_reactive_power",type="l")

#finish drawing all plots
dev.off()

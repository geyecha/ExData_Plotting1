library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#draw the plot
png("plot3.png", width=480, height=480)
plot.ts(TwoDay$Sub_metering_1, ylab="Energy sub metering", axes = FALSE,
        main=NULL, xlab=NULL)
axis(side=1, at=c(1, length(TwoDay$Sub_metering_1)/2, length(TwoDay$Sub_metering_1)),
     labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,10,20,30))
box()
lines(TwoDay$Sub_metering_2, col="red")
lines(TwoDay$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=1, col=c("black","red","blue"))
dev.off()
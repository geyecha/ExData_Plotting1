library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#draw the plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#plot(1,1)
plot.ts(TwoDay$Global_active_power, ylab="Global Active Power", axes = FALSE,
        main=NULL, xlab=NULL)
axis(side=1, at=c(1, length(dt_target$Global_active_power)/2, length(dt_target$Global_active_power)),
     labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6))
box()

#plot(1,2)
plot.ts(TwoDay$Voltage, xlab="datatime", axes = FALSE,
        main=NULL, ylab="Voltage")
axis(side=1, at=c(1, length(TwoDay$Voltage)/2, length(TwoDay$Voltage)),
     labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(234,236,238,240,242,244,246), labels=c("234","","238","","242","","246"))
box()

#plot(2,1)
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

#plot(2,2)
plot.ts(TwoDay$Global_reactive_power, xlab="datatime", axes = FALSE,
        main=NULL, ylab="Global_reactive_power")
axis(side=1, at=c(1, length(TwoDay$Global_reactive_power)/2, length(TwoDay$Global_reactive_power)),
     labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))
box()
dev.off()
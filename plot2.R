library(data.table)
#read raw data
data = fread("household_power_consumption.txt",colClasses="character",na.strings="?")

#extract data from 1/2/2007 to 2/2/2007
TwoDay = data[Date %in% c("1/2/2007","2/2/2007"),]

#draw the plot
png("plot2.png", width=480, height=480)
plot.ts(TwoDay$Global_active_power, ylab="Global Active Power (kilowatts)", axes = FALSE,
        main=NULL, xlab=NULL)
axis(side=1, at=c(1, length(TwoDay$Global_active_power)/2, length(TwoDay$Global_active_power)),
     labels=c("Thu","Fri","Sat"))
axis(side=2, at=c(0,2,4,6))
box()
dev.off()
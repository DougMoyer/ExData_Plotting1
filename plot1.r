setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

setClass('myTime')
setAs("character","myTime", function(from) as.POSIXct(from, format="%H:%M:%S") )

elec <- read.table("./household_power_consumption.txt", na.strings = c('?'),
			sep=";", header = TRUE, stringsAsFactors = FALSE,
			colClasses = c('myDate','myTime',rep('numeric',7))
				)
elec1 <- subset(elec , Date >= "2007-02-01" & Date <= "2007-02-02")
png(filename = "plot1.png",
    width = 480, height = 480)
hist(elec1$Global_active_power, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)')

dev.off()


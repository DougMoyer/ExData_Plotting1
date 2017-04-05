library(dplyr)

elec <- read.table("./household_power_consumption.txt", na.strings = c('?'),
			sep=";", header = TRUE, stringsAsFactors = FALSE,
			colClasses = c('character','character',rep('numeric',7))
				)
elec1 <- elec %>% subset(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(DateTime = as.POSIXct(paste(Date, Time, sep = ' '), format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png",
    width = 480, height = 480)

plot(elec1$DateTime, elec1$Sub_metering_1, 
 col='black', main='', type="l", xlab = '',
 ylab='Energy Sub Metering')
lines(elec1$DateTime, elec1$Sub_metering_2, col='red')
lines(elec1$DateTime, elec1$Sub_metering_3, col='blue')
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 lwd=c(1,1,1), col=c("black", "red", "blue"), cex=0.5)
dev.off()

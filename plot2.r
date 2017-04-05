library(dplyr)

elec <- read.table("./household_power_consumption.txt", na.strings = c('?'),
			sep=";", header = TRUE, stringsAsFactors = FALSE,
			colClasses = c('character','character',rep('numeric',7))
				)
elec1 <- elec %>% subset(Date == "1/2/2007" | Date == "2/2/2007") %>%
	mutate(DateTime = as.POSIXct(paste(Date, Time, sep = ' '), format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png",
    width = 480, height = 480)

plot(elec1$DateTime, elec1$Global_active_power, 
 col='black', main='', type="l", xlab = '',
 ylab='Global Active Power (kilowatts)')

dev.off()


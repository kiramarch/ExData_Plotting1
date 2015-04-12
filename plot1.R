plot1 <- function() {
## requires lubridate and dplyr
## all four function are identical until the PLOT comment below
  
## Read the data
  data <- read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";", 
                     stringsAsFactors = FALSE)

## Create col for POSIX date and time  using lubridate function
## subset to desired date range
  data$DateTime <- dmy_hms(paste(data$Date, data$Time, sep="-"))
  d <- filter(data, month(DateTime) == 2 
              & year(DateTime) == 2007 
              & day(DateTime) <= 2)

## Convert numeric cols to numeric data type so it can be plotted
  d$Global_active_power <- as.numeric(d$Global_active_power)
  d$Global_reactive_power <- as.numeric(d$Global_reactive_power)
  d$Voltage <- as.numeric(d$Voltage)
  d$Global_intensity <- as.numeric(d$Global_intensity)
  d$Sub_metering_1 <- as.numeric(d$Sub_metering_1)
  d$Sub_metering_2 <- as.numeric(d$Sub_metering_2)
  d$Sub_metering_3 <- as.numeric(d$Sub_metering_3)

## PLOT starts here

png(file="plot1.png")

hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab ="Frequency", main = "Global Active Power")

dev.off()

}
plot4 <- function() {
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

png(file="plot4.png")
par(mfcol=c(2,2))

## first of four

plot(d$DateTime, d$Global_active_power, 
     xlab ="", 
     ylab="Global Active Power", 
     type = "l")

## second of four

plot(d$DateTime, d$Sub_metering_1, 
  xlab ="", 
  ylab="Energy sub metering", 
  type = "l")

  legend("topright", lty=1, bty="n",
         col=c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  lines(d$DateTime, d$Sub_metering_2, col="red")
  lines(d$DateTime, d$Sub_metering_3, col="blue")

## third of four

plot(d$DateTime, d$Voltage, 
     xlab ="datetime", 
     ylab="Voltage", 
     type = "l")

## fourth of four
plot(d$DateTime, d$Global_reactive_power, 
     xlab ="datetime", 
     ylab="Global_reactive_power", 
     type = "l")



dev.off()

}
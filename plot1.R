plot1 <- function() {
## requires lubridate and dplyr

## Read the data
  data <- read.table("household_power_consumption.txt", 
                     header=TRUE, sep=";", 
                     stringsAsFactors = FALSE)

## Convert dates and times to POSIX using lubridate functions  
  data$Date <- dmy(data$Date)

data

}
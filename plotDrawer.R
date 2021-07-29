library(tidyverse)

#Plot 1
drawActivePowerByFrequency <- function() {
  hist(data$Global_active_power, 
       col = "red", 
       main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       xaxt="n")
  axis(1, at=seq(0, 6, by = 2))  
}

#Plot 2
drawActivePowerByTimestamp <- function() {
  plot(
    data$timestamp, 
    data$Global_active_power, 
    type ="l", 
    xlab="", 
    ylab="Global Active Power (kilowatts)"
  )
}

#Plot 3
drawSubMeteringByDay <- function(legendBorder = "y") {
  plot(
    data$timestamp, 
    data$Sub_metering_1, 
    col = "black", 
    type="l", 
    xlab = "", 
    ylab = "Energy sub metering"
  )
  lines(data$timestamp, data$Sub_metering_2, col = "red")
  lines(data$timestamp, data$Sub_metering_3, col = "blue")
  legend("topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"),
         lty=c(1,1,1),
         bty=legendBorder
  )
}

#Plots 4
drawVoltageByDay <- function() {
  plot(
    data$timestamp, 
    data$Voltage, 
    type ="l", 
    xlab="datetime", 
    ylab="Voltage"
  )
}

drawActivePowerByDay <- function() {
  plot(
    data$timestamp, 
    data$Global_active_power, 
    type ="l", 
    xlab = "",
    ylab="Global Active Power"
  )
}

drawReativePowerByDay <- function() {
  plot(
    data$timestamp, 
    data$Global_reactive_power, 
    type ="l", 
    xlab="datetime", 
  )
}

# Common Functions
savePlot <- function(fileName) {
  dev.copy(png, paste0(fileName, ".png"),  width = 480, height = 480)
  dev.off()  
}

loadData <- function() {
  content <- unz("data/exdata_data_household_power_consumption.zip", "household_power_consumption.txt")
  data <- read.table(content, TRUE, ";",  na.strings = "?" ) %>%
    filter(Date == "2/2/2007" | Date == "1/2/2007")
  data$timestamp <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S", tz="UTC")
  data
}

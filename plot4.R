plot4<-function () {

      #Read the Data. In Plot 3 and Plot 4 something is missed when I use read_power_data as
      #I did in Plot 1 and Plot 2. Because of lacking time to figure it out. I decide to rerun
      #the reading steps into this two functions
      sourcefile <- "household_power_consumption.txt"
      data <- read.table(sourcefile, header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE, dec=".")
      DPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
      
      # Create de x-axis variable and naming the three y-axis variables
      measuringtime <- strptime(paste(DPC$Date, DPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
      GAP <- as.numeric(DPC$Global_active_power)
      GRP <- as.numeric(DPC$Global_reactive_power)
      V <- as.numeric(DPC$Voltage)
      sM1 <- as.numeric(DPC$Sub_metering_1)
      sM2 <- as.numeric(DPC$Sub_metering_2)
      sM3 <- as.numeric(DPC$Sub_metering_3)

      # Initialize the graphic device, set the layout,
      # build the four graphics, annote them and close the graphic device
      png("plot4.png", width=480, height=480)
      par(mfrow = c(2, 2))  
      plot(measuringtime, GAP, type="l", xlab="Measuring Time", ylab="Global Active Power", cex=0.2)
      plot(measuringtime, V, type="l", xlab="Measuring Time", ylab="Voltage")
      plot(measuringtime, sM1, type="l", ylab="Energy Submetering", xlab="Measuring Time")
      lines(measuringtime, sM2, type="l", col="red")
      lines(measuringtime, sM3, type="l", col="blue")
      legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
      plot(measuringtime, GRP, type="l", xlab="Measuring Time", ylab="Global Reactive Power")
      dev.off()
}

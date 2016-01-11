plot3<-function () {
      
      #Read the Data. In Plot 3 and Plot 4 something is missed when I use read_power_data as
      #I did in Plot 1 and Plot 2. Because of lacking time to figure it out. I decide to rerun
      #the reading steps into this two functions
      sourcefile <- "household_power_consumption.txt"
      data <- read.table(sourcefile, header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE, dec=".")
      DPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

      # Create de x-axis variable and naming the three y-axis variables
      measuringtime <- strptime(paste(DPC$Date, DPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
      sM1 <- as.numeric(DPC$Sub_metering_1)
      sM2 <- as.numeric(DPC$Sub_metering_2)
      sM3 <- as.numeric(DPC$Sub_metering_3)
      
      # Initialize the graphic device, build the plot and close the graphic device
      png("plot3.png", width=480, height=480)
      plot(measuringtime, sM1, type="l", ylab="Energy Submetering", xlab="Measuring Time")
      lines(measuringtime, sM2, type="l", col="red")
      lines(measuringtime, sM3, type="l", col="blue")
      legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
      dev.off()
}

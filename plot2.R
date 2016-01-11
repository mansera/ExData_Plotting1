plot2<-function(){      

      # Read the data
      DPC<-read_power_data()
      
      # Create de x-axis variable and naming the y-axis variable
      measuringtime <- strptime(paste(DPC$Date, DPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
      GAP <- DPC$Global_active_power
      
      # Initialize the graphic device, build the plot and close the graphic device
      png("plot2.png", width=480, height=480)
      plot(measuringtime, GAP, type="l", xlab="Measuring Time", ylab="Global Active Power [kW]")
      dev.off()
}

plot1<-function () {
      
      # Read the data
      DPC<-read_power_data()

      # Initialize the graphic device, build the histogram and close the graphic device      
      png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
      hist(DPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (KW)")
      dev.off()
      
}

Plot1<-function () {
      DPC<-read_power()
      png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
      hist(DPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (KW)")
      dev.off()
}

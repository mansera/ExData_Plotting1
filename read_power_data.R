read_power_data<-function(){

      ## Read the Data from the Downloaded File in Working Directory,
      ## changing the code of Missing Values and properly subsetting them

      sourcefile <- "household_power_consumption.txt"
      data <- read.table(sourcefile, header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE, dec=".")
      DPC <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

      ## Changing numeric variables
      DPC$Global_active_power<-as.numeric(DPC$Global_active_power)
      DPC$Global_reactive_power<-as.numeric(DPC$Global_reactive_power)
      DPC$Voltage<-as.numeric(DPC$Voltage)
      DPC$Global_intensity<-as.numeric(DPC$Global_intensity)
      DPC$Sub_metering_1<-as.numeric(DPC$Sub_metering_1)
      DPC$Sub_metering_2<-as.numeric(DPC$Sub_metering_2)
      DPC$Sub_metering_3<-as.numeric(DPC$Sub_metering_3)

      return(DPC)
}

read_power<-function(){
      
      ## Load dplyr package
      library(dplyr)
      
      ## Read the Data from the Downloaded File in Working Directory
      ## and changing the code of Missing Values
      powerconsumption<-read.csv2("household_power_consumption.txt", na.strings = "?")
      
      ## Changing the data structure of dates
      powerconsumption$Date <-strptime(powerconsumption$Date, "%d/%m/%Y")
      powerconsumption$Date<-as.POSIXct(powerconsumption$Date)
      powerconsumption$Time <-strptime(powerconsumption$Time, "%H")
      powerconsumption$Time<-as.POSIXct(powerconsumption$Time)
      
      ## Subsetting the required data
      powercondata<-dplyr::filter(powerconsumption, Date>="2007-02-01" & Date<="2007-02-02")
      
      ## Changing numeric variables
      powercondata$Global_active_power<-as.numeric(powercondata$Global_active_power)
      powercondata$Global_reactive_power<-as.numeric(powercondata$Global_reactive_power)
      powercondata$Voltage<-as.numeric(powercondata$Voltage)
      powercondata$Global_intensity<-as.numeric(powercondata$Global_intensity)
      powercondata$Sub_metering_1<-as.numeric(powercondata$Sub_metering_1)
      powercondata$Sub_metering_2<-as.numeric(powercondata$Sub_metering_2)
      powercondata$Sub_metering_3<-as.numeric(powercondata$Sub_metering_3)
      
      return(powercondata)
}

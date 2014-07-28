plot2 <- function(){
  
  Sys.setlocale("LC_TIME", "English")
  
  require(data.table)
  data <- suppressWarnings(fread("household_power_consumption.txt",na.strings="?"))
  data <- data[grep("^[1-2]/2/2007",data$Date)]
  data$Global_active_power <- as.numeric(data$Global_active_power)
  
  data <- transform(data, Time.X = paste(Date,Time))
  data$Time.X <- as.POSIXct(strptime(data$Time.X,"%d/%m/%Y %T"))
  
  png("plot2.png",480,480)
  
      with(data, plot(Time.X,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
  
  dev.off()      



}
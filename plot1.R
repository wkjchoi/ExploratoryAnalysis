plot1 <- function(){

  Sys.setlocale("LC_TIME", "English")
  
  require(data.table)
  data <- suppressWarnings(fread("household_power_consumption.txt",na.strings="?"))
  data <- data[grep("^[1-2]/2/2007",data$Date)]
  data$Global_active_power <- as.numeric(data$Global_active_power)
  
  png("plot1.png",480,480)
      hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
  dev.off()      
  
  
  
}
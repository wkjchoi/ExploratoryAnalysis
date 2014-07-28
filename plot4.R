plot4 <- function(){
  
  ##This line is needed for my computer, since the OS is run in Korean
  Sys.setlocale("LC_TIME", "English")
  
  require(data.table)
  data <- suppressWarnings(fread("household_power_consumption.txt",na.strings="?"))
  data <- data[grep("^[1-2]/2/2007",data$Date)]
  data$Global_active_power <- as.numeric(data$Global_active_power)
  
  data <- transform(data, Time.X = paste(Date,Time))
  data$Time.X <- as.POSIXct(strptime(data$Time.X,"%d/%m/%Y %T"))
  
  png("plot4.png",480,480)
      par(mfrow = c(2,2))
      with(data,{
                plot(Time.X,Global_active_power,type="l",xlab="",ylab="Global Active Power")
                plot(Time.X,Voltage,type="l",xlab="datetime",ylab="Voltage")
                {
                  plot(Time.X,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
                  lines(Time.X,Sub_metering_2,type="l",col="red")
                  lines(Time.X,Sub_metering_3,type="l",col="blue")
                  legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                }
                plot(Time.X,Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")

                }
  )
dev.off()      



}
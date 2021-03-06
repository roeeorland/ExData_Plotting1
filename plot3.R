
hpc_long<-read.csv2("household_power_consumption.txt")
Sys.setlocale("LC_ALL","English")
library(lubridate)
library(dplyr)
hpc=rbind(hpc_long[grep("^1/2/2007",hpc_long$Date),],hpc_long[grep("^2/2/2007",hpc_long$Date),])
hpc$Global_active_power=as.numeric(as.character(hpc$Global_active_power))
hpc$Date<-as.character(hpc$Date)
hpc$Time<-as.character(hpc$Time)
hpc=mutate(hpc, date_time = paste(Date, Time, sep = " "))
hpc$date_time = dmy_hms(hpc$date_time)
hpc$Sub_metering_1<-as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2<-as.numeric(as.character(hpc$Sub_metering_2))
hpc$Sub_metering_3<-as.numeric(as.character(hpc$Sub_metering_3))
plot(hpc$date_time,hpc$Sub_metering_3,type = "n", xlab = "", ylab = "Energy sub metering", ylim = c(0,38))
lines(hpc$date_time,hpc$Sub_metering_1, col = "black")
lines(hpc$date_time,hpc$Sub_metering_2, col = "red")
lines(hpc$date_time,hpc$Sub_metering_3, col = "blue")
legend("topright",lty=1,col=c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "plot3.png", height = 480, width = 480, units = "px")
dev.off()



hpc_long<-read.csv2("household_power_consumption.txt")
hpc=rbind(hpc_long[grep("^1/2/2007",hpc_long$Date),],hpc_long[grep("^2/2/2007",hpc_long$Date),])
hpc$Global_active_power=as.numeric(as.character(hpc$Global_active_power))
hist(a$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png,file = "plot1.png", height = 480, width = 480, units = "px")



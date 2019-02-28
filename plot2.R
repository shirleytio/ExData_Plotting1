setwd("C:/Users/MULBE/Documents/Mickey Mouse/R_course/Coursera")

fileall <- read.table("household_power_consumption.txt",sep=";", na.strings="?", skip=1)
names(fileall) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")  
file1 <- subset(fileall, Date %in% c("1/2/2007","2/2/2007"))
file1$Date1 <- as.Date(file1$Date, format="%d/%m/%Y")

filedatetime <- paste(file1$Date1, file1$Time)
file1$Datetime  <- as.POSIXct(filedatetime)  

png(file="plot2.png",width=480,height=480)
plot(file1$Datetime, file1$Global_active_power, type = "l", xlab="", ylab="Global Active Power(Kilowatts)")

#dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()
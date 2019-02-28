setwd("C:/Users/MULBE/Documents/Mickey Mouse/R_course/Coursera")

fileall <- read.table("household_power_consumption.txt",sep=";", na.strings="?", skip=1)
names(fileall) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")  
file1 <- subset(fileall, Date %in% c("1/2/2007","2/2/2007"))
file1$Date <- as.Date(file1$Date, format="%d/%m/%y")

png(file="plot1.png",width=480,height=480)
hist(file1$Global_active_power, main="Global Active Power",col="red", 
     xlab="Global Active Power (kilowatts)",ylab="Frequency")

#dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()
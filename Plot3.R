## loading R packages 

options(width=2000)

library(scales)
library(ggplot2)


household_power_consumption <- read.table(file.choose(), header = T, sep = ";")



## viewing original data set #
head(household_power_consumption)

# formatting date in same format #

household_power_consumption$Date2 <- as.Date(household_power_consumption$Date, format = "%m/%d/%Y")

## subsetting data set for the given range #
newdataset <- subset(household_power_consumption, Date2 >= "2007-02-01" & Date2 <= "2007-02-02")

#head(newdataset)
#tail(newdataset)


## formatting date, time # 
Date_Time <- strptime(paste(newdataset$Date, newdataset$Time, sep=" "), "%m/%d/%Y %H:%M:%S") 
Global_Active_Power <- as.numeric(newdataset$Global_active_power)


SM1 <- as.numeric(newdataset$Sub_metering_1)
SM2 <- as.numeric(newdataset$Sub_metering_2)
SM3 <- as.numeric(newdataset$Sub_metering_3)



plot3 <- plot(Date_Time, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(Date_Time,SM2, type="l", col="red")
lines(Date_Time, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd= par("lwd"), col=c("black", "red", "blue"))

plot3

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

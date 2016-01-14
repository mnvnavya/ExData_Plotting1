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


# plotting histogram #

plot2 <- plot(Date_Time, Global_Active_Power, type = "l", lty = "solid", cex=0.2, xlab = " ", ylab = "Global Active Power(kilowatts)")
plot2


# saving image
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()










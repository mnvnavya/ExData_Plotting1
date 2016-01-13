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

head(newdataset)
tail(newdataset)

# plotting histogram #
plot1 <- hist(as.numeric(newdataset$Global_active_power), main = "Global Active POwer",xlab = "Global Active Power(kilowatts)", col = "Red")
plot1






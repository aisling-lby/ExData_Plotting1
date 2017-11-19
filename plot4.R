setwd("/Users/boyaliu/Documents/Coursera/Data Science/EDA/hw1")
house_df <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
sub_df <- subset(house_df, house_df$Date %in% c("1/2/2007", "2/2/2007"))
for (i in c("Global_active_power", 'Voltage', 'Sub_metering_1', 'Sub_metering_2',
           'Sub_metering_3', 'Global_reactive_power')) {
  sub_df[[i]] <- as.numeric(sub_df[[i]])
}
sub_df$datetime <- strptime(paste(as.Date(sub_df$Date, '%d/%m/%Y'), sub_df$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(sub_df$datetime, sub_df$Global_active_power, type = 'l', xlab = "",
     ylab = "Global Active Power")
plot(sub_df$datetime, sub_df$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(sub_df$datetime, sub_df$Sub_metering_1, type = 'l', xlab = "",
     ylab = "Energy sub metering")
lines(sub_df$datetime, sub_df$Sub_metering_2, col = 'red')
lines(sub_df$datetime, sub_df$Sub_metering_3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = 'n')

plot(sub_df$datetime, sub_df$Global_reactive_power, type = "l", xlab = 'datetime',
     ylab = "Global_reactive_power")

dev.off()

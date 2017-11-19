setwd("/Users/boyaliu/Documents/Coursera/Data Science/EDA/hw1")
house_df <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
sub_df <- subset(house_df, house_df$Date %in% c("1/2/2007", "2/2/2007"))
sub_df$datetime <- strptime(paste(as.Date(sub_df$Date, '%d/%m/%Y'), sub_df$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
for (i in c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')) {
  sub_df[[i]] <- as.numeric(sub_df[[i]])
}

png(filename = "plot3.png", width=480, height=480)
plot(sub_df$datetime, sub_df$Sub_metering_1, type = 'l', xlab = "",
     ylab = "Energy sub metering")
lines(sub_df$datetime, sub_df$Sub_metering_2, col = 'red')
lines(sub_df$datetime, sub_df$Sub_metering_3, col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1),
       lwd=c(2, 2, 2), col = c("black", "red", "blue"))
dev.off()


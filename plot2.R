setwd("/Users/boyaliu/Documents/Coursera/Data Science/EDA/hw1")
house_df <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors=FALSE, na.strings = "?")
sub_df <- subset(house_df, house_df$Date %in% c("1/2/2007", "2/2/2007"))
sub_df$Global_active_power <- as.numeric(sub_df$Global_active_power)
sub_df$datetime <- strptime(paste(as.Date(sub_df$Date, '%d/%m/%Y'), sub_df$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

dev.copy(png, 'plot2.png', height = 480, width = 480)
plot(sub_df$datetime, sub_df$Global_active_power, type = 'l', xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

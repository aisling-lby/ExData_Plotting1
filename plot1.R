setwd("/Users/boyaliu/Documents/Coursera/Data Science/EDA/hw1")
house_df <- read.table('household_power_consumption.txt', header = T, sep = ';', 
                       stringsAsFactors=FALSE, na.strings = "?")
sub_df <- subset(house_df, house_df$Date %in% c("1/2/2007", "2/2/2007"))
sub_df$Global_active_power <- as.numeric(sub_df$Global_active_power)

png(filename = "plot1.png", width=480, height=480)
hist(sub_df$Global_active_power, col = 'red', 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

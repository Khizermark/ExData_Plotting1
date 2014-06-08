#Read part of data to understand the data
part_of_data = read.table("household_power_consumption.txt",nrows = 5)
part_of_data
# After learning the data we come to know that seperator is ";" and it has headers
full_data = read.table("household_power_consumption.txt",sep = ";",header = T)
head(full_data)
#subsetting the required dates
subset_data = subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
head(subset_data)
# open PNG device
png(file = "plot1.png")
# Plotting the histogram
hist(as.numeric(as.character(subset_data$Global_active_power)), main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", col = "Red"     )
# Close the device
dev.off()
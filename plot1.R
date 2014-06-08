part_of_data = read.table("household_power_consumption.txt",nrows = 5)
part_of_data

full_data = read.table("household_power_consumption.txt",sep = ";",header = T)
head(full_data)

subset_data = subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
head(subset_data)
colnames(subset_data)
png(file = "plot1.png")
hist(as.numeric(as.character(subset_data$Global_active_power)), main = "Global Active Power",
          xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", col = "Red"     )
dev.off()
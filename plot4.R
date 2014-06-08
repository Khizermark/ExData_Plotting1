#Read part of data to understand the data
part_of_data = read.table("household_power_consumption.txt",nrows = 5)
part_of_data
# After learning the data we come to know that seperator is ";" and it has headers
full_data = read.table("household_power_consumption.txt",sep = ";",header = T)
head(full_data)
#subsetting the required dates
subset_data = subset(full_data, Date == "1/2/2007" | Date == "2/2/2007")
head(subset_data)

#Formatting Date as required
subset_data$Date = as.Date(subset_data$Date, "%d/%m/%Y")
# Making a new variable which has both date and time
new_variable = paste(subset_data$Date,as.character(subset_data$Time),sep=",")
subset_data$DateTime = strptime(new_variable,"%Y-%m-%d,%H:%M:%S")

# Converting to required variable formats from factor variables
subset_data$Global_active_power = as.numeric(as.character(subset_data$Global_active_power))
subset_data$Sub_metering_1 = as.numeric(as.character(subset_data$Sub_metering_1))
subset_data$Sub_metering_2 = as.numeric(as.character(subset_data$Sub_metering_2))
subset_data$Sub_metering_3 = as.numeric(as.character(subset_data$Sub_metering_3))
subset_data$Voltage = as.numeric(as.character(subset_data$Voltage))
subset_data$Global_reactive_power = as.numeric(as.character(subset_data$Global_reactive_power))

# open PNG device
png(file = "plot4.png")

# Plotting the figures ROW WISE
par(mfrow = c(2,2))

# First Plot
plot(subset_data$DateTime, subset_data$Global_active_power,type ="l",ylab = "Global Active Power (kilowatts)" , xlab= ""    )
# Second Plot
plot(subset_data$DateTime,subset_data$Voltage, type = "l", ylab = "Voltage",xlab = "datetime")
# Third Plot
plot(subset_data$DateTime, subset_data$Sub_metering_1,type ="l", ylab = "Energy sub metering" , xlab= ""    )
lines(subset_data$DateTime, subset_data$Sub_metering_2,col = "Red")
lines(subset_data$DateTime, subset_data$Sub_metering_3,col = "Blue")
legend("topright", lwd = 2, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Fourth Plot
plot(subset_data$DateTime,subset_data$Global_reactive_power, type = "l", ylab = "Global_reactive_power",xlab = "datetime")

# Close the device
dev.off()

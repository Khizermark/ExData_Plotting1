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
# open PNG device
png(file = "plot1.png")
# Plotting the figure
subset_data$Global_active_power = as.numeric(as.character(subset_data$Global_active_power))
plot(subset_data$DateTime, subset_data$Global_active_power,type ="l", 
     ylab = "Global Active Power (kilowatts)" , xlab= ""    )
# Close the device
dev.off()

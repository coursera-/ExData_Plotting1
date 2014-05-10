# Use pipe to grep date from 1/2/2007 and 2/2/2007
# Specify delimeter for this data with sep=";"
# Specify column names lost during grepping
d <- read.table(file=pipe("grep '^[12]/2/2007' household_power_consumption.txt"),sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Merge date and time in a new column, convert it to date/time class
d$DateTime <- paste(d$Date,d$Time)
d$DateTime <- strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

# Make a histogram of global active power vs date/time
# Specify type of the plot (line)
# Specify titles of x and y axes
with(d,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Save the histogram to a PNG file
# Close PNG device
dev.copy(png,"plot2.png")
dev.off()


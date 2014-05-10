# Use pipe to grep date from 1/2/2007 and 2/2/2007
# Specify delimeter for this data with sep=";"
# Specify column names lost during grepping
d <- read.table(file=pipe("grep '^[12]/2/2007' household_power_consumption.txt"),sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Open PNG device
png("plot1.png")

# Make a histogram of global active power
# Specify main title and title of x axis
hist(d$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Close PNG device
dev.off()


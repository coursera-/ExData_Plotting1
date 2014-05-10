# Use pipe to grep date from 1/2/2007 and 2/2/2007
# Specify delimeter for this data with sep=";"
# Specify column names lost during grepping
d <- read.table(file=pipe("grep '^[12]/2/2007' household_power_consumption.txt"),sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Merge date and time in a new column, convert it to date/time class
d$datetime <- paste(d$Date,d$Time)
d$datetime <- strptime(d$datetime, "%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot4.png")

#Create a matrix of 2 rows with 2 plots in each row
par(mfrow=c(2,2))

# 1st plot
with(d,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# 2nd plot
with(d,plot(datetime,Voltage,type="l",ylab="Voltage"))

# 3rd plot
# Make a histogram of Sub_metering_1 vs date/time
# Specify type of the plot (line)
# Specify titles of x and y axes
# Add lines of Sub_metering_2 vs date/time in red color
# Add lines of Sub_metering_3 vs date/time in blue color
# Add legend
with(d,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(d,lines(datetime,Sub_metering_2,col="red"))
with(d,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#4th plot
with(d,plot(datetime,Global_reactive_power,type="l"))

# Close PNG device
dev.off()

# This code generates plot 4 for Peer graded assignment of Exploratory Data Analysis
# Reading file 
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting data between 1/2/2007 and 2/2/2007 
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# Making plot4.png
datetime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=""),"%d/%m/%Y %H:%M:%S")
subsetdata$Global_active_power=as.numeric(as.character(subsetdata$Global_active_power))
subsetdata$Voltage=as.numeric(as.character(subsetdata$Voltage))
subsetdata$Global_reactive_power=as.numeric(as.character(subsetdata$Global_reactive_power))
par(mfrow=c(2,2))
plot(datetime,subsetdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(datetime,subsetdata$Voltage,type="l",xlab="datetime",ylab="Voltage")
subsetdata$Sub_metering_1=as.numeric(as.character(subsetdata$Sub_metering_1))
subsetdata$Sub_metering_2=as.numeric(as.character(subsetdata$Sub_metering_2))
subsetdata$Sub_metering_3=as.numeric(as.character(subsetdata$Sub_metering_3))
plot(datetime,subsetdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(datetime,subsetdata$Sub_metering_2,type="l",col="red")
lines(datetime,subsetdata$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
plot(datetime,subsetdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,"plot4.png",height=480,width=480)
dev.off()
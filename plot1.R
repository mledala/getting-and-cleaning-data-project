# This code generates plot 1 for Peer graded assignment of Exploratory Data Analysis
# Reading file 
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

# subsetting data between 1/2/2007 and 2/2/2007 
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# Making plot1.png
datetime<-strptime(paste(subsetdata$Date,subsetdata$Time,sep=""),"%d/%m/%Y %H:%M:%S")
subsetdata$Global_active_power=as.numeric(as.character(subsetdata$Global_active_power))
hist(subsetdata$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png,"plot1.png",height=480,width=480)
dev.off()
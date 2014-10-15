mydata = read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)
mydata$Date = as.Date(mydata$Date,"%d/%m/%Y")
smalldata <- mydata[mydata$Date == "2007-02-02" | mydata$Date == "2007-02-01",]
hist(smalldata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
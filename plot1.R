#Download the data
tempdir=tempdir()
filepath=tempfile(tmpdir=tempdir,fileext=".zip")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filepath)
fname=unzip(filepath,exdir=tempdir,overwrite=TRUE)

#Clean it up
mydata = read.table(fname,na.strings="?",sep=";",header=TRUE)
mydata$Date = as.Date(mydata$Date,"%d/%m/%Y")
smalldata <- mydata[mydata$Date == "2007-02-02" | mydata$Date == "2007-02-01",]

#Plot the data
png("plot1.png",width=480,height=480)
mydata = read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)
mydata$Date = as.Date(mydata$Date,"%d/%m/%Y")
smalldata <- mydata[mydata$Date == "2007-02-02" | mydata$Date == "2007-02-01",]
hist(smalldata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
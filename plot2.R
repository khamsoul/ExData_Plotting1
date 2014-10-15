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
png("plot2.png",width=480,height=480)
plot(smalldata$Global_active_power,type='l',axes=FALSE,ylab="Global Active Power (kilowatts)",xlab="")
xmax=length(smalldata$Date)
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6),lab=c(0,2,4,6))
box("plot")
dev.off()
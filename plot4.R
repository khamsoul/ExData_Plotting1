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
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
xmax=length(smalldata$Date)

#Top left graph
plot(smalldata$Global_active_power,type='l',axes=FALSE,ylab="Global Active Power (kilowatts)",xlab="")
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6),lab=c(0,2,4,6))
box("plot")

#Top right graph
plot(smalldata$Voltage,type='l',axes=FALSE,ylab="Voltage",xlab="datetime")
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=c(234,238,242,246),lab=c(234,238,242,246))
box("plot")

#Bottom left graph
plot(smalldata$Sub_metering_1,type='l',axes=FALSE,ylab="Energy sub metering",xlab="")
lines(smalldata$Sub_metering_2,col="red")
lines(smalldata$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n",pt.cex=1,cex=0.7)
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30),lab=c(0,10,20,30))
box("plot")

#Bottom right graph
plot(smalldata$Global_reactive_power,type='l',axes=FALSE,ylab="Global_reactive_power",xlab="datetime")
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=0:5/10,lab=0:5/10)
box("plot")
dev.off()

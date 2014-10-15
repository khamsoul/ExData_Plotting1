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
png("plot3.png",width=480,height=480)
plot(smalldata$Sub_metering_1,type='l',axes=FALSE,ylab="Energy sub metering",xlab="")
lines(smalldata$Sub_metering_2,col="red")
lines(smalldata$Sub_metering_3,col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),pt.cex=1,cex=0.9)
xmax=length(smalldata$Date)
axis(1, at=0:2*xmax/2,lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30),lab=c(0,10,20,30))
box("plot")
dev.off()
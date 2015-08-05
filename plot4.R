##Download the zip file
URL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp=tempfile()
download.file(URL,destfile = temp)

##Extract the data from zip
data=read.table(unz(temp,"household_power_consumption.txt"),sep = ";",na.strings = "?",header = TRUE)
unlink(temp)
rm(URL,temp)

#Filter only the related part
refined=data[as.Date(data$Date,"%d/%m/%Y")=="2007-02-02"|as.Date(data$Date,"%d/%m/%Y")=="2007-02-01",]

#Constructing the plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(refined,{
#plot c(1,1)
  plot(Global_active_power,ylab="Global Active Power",xlab ="",type = "l",xaxt = "n")
  axis(1,at=seq(1,nrow(refined),by=(floor((nrow(refined)-1)/2))),labels = c("Thu","Fri","Sat"))
#plot c(1,2)
  plot(Voltage,xlab="datetime",ylab="Voltage",type = "l",xaxt="n")
  axis(1,at=seq(1,nrow(refined),by=(floor((nrow(refined)-1)/2))),labels = c("Thu","Fri","Sat"))
#Plot c(2,1)
  plot(Sub_metering_1,col="black",ylab="Energy Sub metering",xlab ="",type = "l",xaxt = "n")
  lines(Sub_metering_2,col="red",ylab="Energy Sub metering",xlab ="",type = "l",xaxt = "n")
  lines(Sub_metering_3,col="blue",ylab="Energy Sub metering",xlab ="",type = "l",xaxt = "n")
  axis(1,at=seq(1,nrow(refined),by=(floor((nrow(refined)-1)/2))),labels = c("Thu","Fri","Sat"))
  legend("topright",pch="_",pch,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot c(2,2)
  plot(Global_reactive_power,xlab="datetime",type = "l",xaxt="n")
  axis(1,at=seq(1,nrow(refined),by=(floor((nrow(refined)-1)/2))),labels = c("Thu","Fri","Sat"))
})
dev.off()
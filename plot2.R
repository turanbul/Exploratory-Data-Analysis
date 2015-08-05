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
png(filename = "plot2.png", width = 480, height = 480)
with(refined,plot(Global_active_power,ylab="Global Active Power (kilowatts)",xlab ="",type = "l",xaxt = "n"))
axis(1,at=seq(1,nrow(refined),by=(floor((nrow(refined)-1)/2))),labels = c("Thu","Fri","Sat"))
dev.off()
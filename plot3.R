#assuming you're in working directory, reads in appropriate cols
data<- read.table("./household_power_consumption.txt", sep=";", dec=".", nrows=2880 , skip=66637, stringsAsFactors=FALSE)
#extracts first row of text file to use as variable names
varNames<-read.table("./household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
names(data)<- varNames

# concatenates "Date" & "Time" vars, uses 'strptime' to format
#this enables x-axis to use both time and date
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


# plots graph and sends to png file (places it on Desktop)
png("plot3.png",width=480, height=480)
attach(data)
plot(Date,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(Date,Sub_metering_2,type="l",col="red")
lines(Date,Sub_metering_3,type="l",col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
       legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
detach(data)
dev.off()

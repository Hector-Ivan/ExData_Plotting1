#assuming you're in working directory, reads in appropriate cols
data<- read.table("./household_power_consumption.txt", sep=";", dec=".", nrows=2880 , skip=66637, stringsAsFactors=FALSE)
#extracts first row of text file to use as variable names
varNames<-read.table("./household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
names(data)<- varNames

# concatenates "Date" & "Time" vars, uses 'strptime' to format
#this enables x-axis to use both time and date
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# plots graph and sends to png file (places it on Desktop)
png("plot2.png",width=480, height=480)
attach(data)
plot(Date,Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
detach(data)
dev.off()




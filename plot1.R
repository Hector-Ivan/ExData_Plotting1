#assuming 'household_power_consumption.txt' is in working directory,
# the line below reads in appropriate cols
data<- read.table("./household_power_consumption.txt", sep=";", dec=".", nrows=2880 , skip=66637, stringsAsFactors=FALSE)
#extracts first row of text file to use as variable names
varNames<-read.table("./household_power_consumption.txt",sep=";",nrows=1,stringsAsFactors=FALSE)
names(data)<- varNames

#creates a plot and sends it as a png file to 'plot1.png'
png("plot1.png", width=480, height=480)
attach(data)
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power", ylim=c(0,1200))
detach(data)
dev.off()


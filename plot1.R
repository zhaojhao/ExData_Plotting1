alldata <- read.csv("household_power_consumption.txt",sep=";", na.strings="?", colClasses=c("character", "character",rep("numeric", 7)))
subdata <- subset(alldata, Date == "2/2/2007" | Date == "1/2/2007")
rm(alldata)
timdata = transform(subdata, Date = as.Date(Date, format="%d/%m/%Y"), Time=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png(filename="plot1.png")
par(mfrow=c(1,1))
with(timdata, hist(Global_active_power, col="red", xlab="Global Active Power (killowatts)", main="Global Active Power"))
dev.off()
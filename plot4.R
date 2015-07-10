data <- read.csv('household_power_consumption.txt', sep=';',stringsAsFactors=FALSE )
data[,1] <- as.Date(data[,1],'%d/%m/%Y')
ld = as.Date('2007-02-01','%Y-%m-%d')
rd = as.Date('2007-02-02','%Y-%m-%d')
df = data[data[,1]>=ld & data[,1]<=rd,]
df[,7] <- as.numeric(df[,7])
df[,8] <- as.numeric(df[,8])
df[,9] <- as.numeric(df[,9])
df[,4] <- as.numeric(df[,4])
df[,3] <- as.numeric(df[,3])
df[,5] <- as.numeric(df[,5])
x <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(bg="transparent", mfrow=c(2,2))

plot(x, df$Global_active_power/500, xlab='', ylab="Global Active Power", type="n")
lines(x, df$Global_active_power/500)

plot(x, df$Voltage, xlab='datetime', ylab="Voltage", type="n")
lines(x, df$Voltage)

plot(x, df$Sub_metering_1, ylim=c(0,40), xlab='', ylab='Energy sub metering', type="n",mar = c(1, 2, 1, 1))
lines(x, df$Sub_metering_1, col='black')
lines(x, df$Sub_metering_2, col='red')
lines(x, df$Sub_metering_3, col='blue')
legend("topright", col = c("black","red", "blue"), lty=c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x, df$Global_reactive_power, xlab='datetime', ylab="Global_reactive_power", type="n")
lines(x, df$Global_reactive_power)

 
dev.off()


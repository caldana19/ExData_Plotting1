data <- read.csv('household_power_consumption.txt', sep=';')
data[,1] <- as.Date(data[,1],'%d/%m/%Y')
ld = as.Date('2007-02-01','%Y-%m-%d')
rd = as.Date('2007-02-02','%Y-%m-%d')
df = data[data[,1]>=ld & data[,1]<=rd,]
df[,3] <- as.numeric(df[,3])
hist(df$Global_active_power/500, breaks=12, col='red', main='', xlab="Global Active Power (kilowatts)")
title(main="Global Active Power")


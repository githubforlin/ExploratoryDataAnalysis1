# Plot 4
setwd("C:/Users/zyang/Documents/R_ExploratoryDataAnalysis_Week1")
df <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880, sep = ";")
name <- sapply(read.table("household_power_consumption.txt", nrow = 1, sep = ";"), as.character)
names(df) <- name
df$DateTime <- strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
for( i in 3:9 ){
    df[[i]] <- sapply(df[[i]], as.character)
    df[[i]] <- sapply(df[[i]], as.numeric)
}
win.graph(200,200)
par(mfcol = c(2,2))
with(df, {plot(DateTime, Global_active_power, type = "n", xlab = "datetime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(df$DateTime)), as.numeric(min(df$DateTime))+86400, as.numeric(min(df$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(df, points(DateTime, Global_active_power, type = "l"))
          plot(DateTime, Sub_metering_1, type = "n", xlab = "datetime", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(df$DateTime)), as.numeric(min(df$DateTime))+86400
                       , as.numeric(min(df$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(df, points(DateTime, Sub_metering_1, type = "l"))
          with(df, points(DateTime, Sub_metering_2, type = "l", col = "red"))
          with(df, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
          legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",lwd=2, cex=1.1,y.intersp=1.4, col=c("black","red","blue"), lty=c(1,1,1))          
          plot(DateTime, Voltage, type = "n", xlab = "datetime", ylab = "Voltage (volts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(df$DateTime)), as.numeric(min(df$DateTime))+86400
             , as.numeric(min(df$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(df, points(DateTime, Voltage, type = "l"))
          plot(DateTime, Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global Reactive Power (kilowatts)" , axes = F, frame.plot=TRUE)
          axis(1, at=c(as.numeric(min(df$DateTime)), as.numeric(min(df$DateTime))+86400
             , as.numeric(min(df$DateTime))+2*86400), labels=c("Thu", "Fri", "Sat"))
          axis(2, yaxs = "r")
          with(df, points(DateTime, Global_reactive_power, type = "l"))
          })
png(filename = "plot4.png", height = 480, width = 480)  #first create a png file (instead of using dev.copy)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?",
                   colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   stringsAsFactors = FALSE)  #read all data
dat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))  #subset data of relevant days
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")    #change Dates to Date-Format, readable by R
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(date_time)

par(mfcol = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(dat,{
        plot(Global_active_power ~ Datetime, type = "l",xlab = "",  #Plot1
             ylab = "Global Active Power (kilowatts)")
        
        #Plot2
        plot(Sub_metering_1 ~ Datetime, type = "l",col = "black", 
             xlab = "",ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ Datetime, type = "l", col = "red")
        lines(Sub_metering_3 ~ Datetime, type = "l", col = "blue")
        legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               y.intersp = 0.5, x.intersp = 0.5, cex = 0.5, bty ="n")
        
        #Plot3
        plot(Voltage ~ Datetime, type = "l", xlab = "datetime")
        
        #Plot4
        plot(Global_reactive_power ~ Datetime, type = "l", xlab = "datetime")
})

dev.off()

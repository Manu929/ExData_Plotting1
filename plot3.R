data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?",
                   colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   stringsAsFactors = FALSE)  #read all data
dat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))  #subset data of relevant days
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")    #change Dates to Date-Format, readable by R
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(date_time)


#Plot3
with(dat,{
        plot(Sub_metering_1 ~ Datetime, type = "l",col = "black", 
             xlab = "",ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ Datetime, type = "l", col = "red")
        lines(Sub_metering_3 ~ Datetime, type = "l", col = "blue")
        legend(lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               "topright", y.intersp = 0.5, x.intersp = 0.5, cex = 0.8)
})

dev.copy(png, file = "plot3.png", height = 480, width = 480)  #save copy of this plot as png-file3
dev.off()
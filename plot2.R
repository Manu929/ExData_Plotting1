data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?",
                   colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   stringsAsFactors = FALSE)  #read all data
dat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))  #subset data of relevant days
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")    #change Dates to Date-Format, readable by R
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(date_time)

#Plot2
with(dat,{                                               
        plot(Global_active_power ~ Datetime, type = "l",xlab = "",
             ylab = "Global Active Power (kilowatts)")
})

dev.copy(png, file = "plot2.png", height = 480, width = 480)  #save copy of this plot as png-file2
dev.off()
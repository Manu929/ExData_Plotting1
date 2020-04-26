data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?",
                   colClasses = c("character","character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   stringsAsFactors = FALSE)  #read all data
dat <- subset(data, Date %in% c("1/2/2007","2/2/2007"))  #subset data of relevant days

#Plot1
hist(dat$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main ="Global Active Power")

dev.copy(png, file = "plot1.png", height = 480, width = 480)  #save copy of this histogram as png-file
dev.off()
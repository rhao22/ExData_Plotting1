dat = read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

dat$Time <- strptime(paste(dat$Date , dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(strptime(dat$Date, "%d/%m/%Y"))

start_date <-as.Date(strptime("01/02/2007", "%d/%m/%Y"))
end_date <-as.Date(strptime("02/02/2007", "%d/%m/%Y"))


subset_dat <- dat[which((dat$Date==start_date) | (dat$Date==end_date)), ]
  
plot(subset_dat$Time, subset_dat$Global_active_power,
     type="n",
     xlab="",
     ylab="Global Active Power (kilowatt)"
)
lines(subset_dat$Time, subset_dat$Global_active_power)


dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

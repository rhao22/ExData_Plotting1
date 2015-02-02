dat = read.csv("household_power_consumption.txt", sep = ";", header = TRUE)
dat$Date <- as.Date(strptime(dat$Dat, "%d/%m/%Y"))

start_date <-as.Date(strptime("01/02/2007", "%d/%m/%Y"))
end_date <-as.Date(strptime("02/02/2007", "%d/%m/%Y"))


subset_dat <- dat[which((dat$Date==start_date) | (dat$Date==end_date)), ]
  
hist(as.numeric(as.character(subset_dat$Global_active_power)), 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatt)"
     )

dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

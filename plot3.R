dat = read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

dat$Time <- strptime(paste(dat$Date , dat$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
dat$Date <- as.Date(strptime(dat$Date, "%d/%m/%Y"))

start_date <-as.Date(strptime("01/02/2007", "%d/%m/%Y"))
end_date <-as.Date(strptime("02/02/2007", "%d/%m/%Y"))


subset_dat <- dat[which((dat$Date==start_date) | (dat$Date==end_date)), ]
png(file = "plot3.png")  ## Open PDF device; create 'myplot.pdf' in my working directory

plot(subset_dat$Time, as.numeric(as.character(subset_dat$Sub_metering_1)),
     type="n",
     xlab="",
     ylab="Energy sub metering",
     width = 480, 
     height = 480, 
     units = "px"
)
lines(subset_dat$Time, as.numeric(as.character(subset_dat$Sub_metering_1)))
lines(subset_dat$Time, as.numeric(as.character(subset_dat$Sub_metering_2)), col="red")
lines(subset_dat$Time, as.numeric(as.character(subset_dat$Sub_metering_3)), col="blue")


legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "blue","red")
       ) 


#dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!


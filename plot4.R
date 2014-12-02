data<-read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')
Sys.setlocale("LC_TIME", "English")
t <- paste(as.character(dat$Date), as.character(dat$Time))
time <- strptime(t, "%e/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
par(mar=c(4,4,2,2))
plot(time, as.numeric(as.character(dat$Global_active_power)), xlab="", ylab="Global Active Power", cex.lab=0.8, cex.axis=0.8, cex.main=0.8, type="o", pch=".", bg=par("bg"))
plot(time, as.numeric(as.character(dat$Voltage)), xlab="datetime", ylab="Voltage", cex.lab=0.8, cex.axis=0.8, cex.main=0.8, type="o", pch=".", bg=par("bg"))
plot(time, as.numeric(as.character(dat$Sub_metering_1)), xlab="", ylab="Energy sub metering", cex.lab=0.8, cex.axis=0.8, cex.main=0.8, type="n")
points(time, as.numeric(as.character(dat$Sub_metering_1)), type="o", pch=".", bg=par("bg"))
points(time, as.numeric(as.character(dat$Sub_metering_2)), col = "red", type="o", pch=".", bg=par("bg"))
points(time, as.numeric(as.character(dat$Sub_metering_3)), col = "blue", type="o", pch=".", bg=par("bg"))
legend("topright", pch=NA, bg=par("bg"), cex=0.75, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1))
plot(time, as.numeric(as.character(dat$Global_reactive_power)), xlab="datetime", ylab="Global_reactive_power", cex.lab=0.8, cex.axis=0.8, cex.main=0.8, type="o", pch=".", bg=par("bg"))
dev.off()

#The plot itself may be viewed after clicking on https://github.com/zubr/ExData_Plotting1
#then click on "... [No. of] commits" and the plot is attached as a comment to commit "Create plot4.R"
#Unfortunately I cannot install github on my pc (windows XP) and there seem to be no
#other option to download a chart on github (i.e. without cloning the repo in desktop).

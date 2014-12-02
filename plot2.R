data<-read.table('household_power_consumption.txt', header=TRUE, sep=';')
dat <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')
Sys.setlocale("LC_TIME", "English")
t <- paste(as.character(dat$Date), as.character(dat$Time))
time <- strptime(t, "%e/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(time, as.numeric(as.character(dat$Global_active_power)), xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.8, cex.axis=0.8, cex.main=0.8, type="o", pch=".", bg=par("bg"))
dev.off()

#The plot itself may be viewed after clicking on https://github.com/zubr/ExData_Plotting1 
#then click on "... commits" and the plot is attached as a comment to commit "Update plot2.R"
#Sorry for that but I cannot install github on my pc (windows XP) and there seem to be no
#other option to download a chart on github (i.e. without cloning the repo in desktop).

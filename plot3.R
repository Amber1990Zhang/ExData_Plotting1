#Plot3

#Download data and unzip
if(!file.exists("./Exploratory_Data_Analysis")) 
{dir.create("./Exploratory_Data_Analysis")}
unzip(zipfile = "./Exploratory_Data_Analysis/Electric_Power_Consumption.zip")

#Read data
files <- file('./household_power_consumption.txt')
week1data <-  read.table(text = grep("^[1,2]/2/2007",readLines(files),
                                     value=TRUE), sep = ';', 
                         col.names = c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage", "Global_intensity",
                                       "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         na.strings = '?')
names(week1data) <- tolower(names(week1data))

#Convert date and time to specific format
week1data$date <- as.Date(week1data$date, '%d/ %m/ %Y')
week1data$datetime <- as.POSIXct(paste(week1data$date, week1data$time)) 

#Open device
if(!file.exists('plots')) {dir.create('plots')}
png(filename = './plots/plot3.png', width = 480, height = 480, units = 'px')

#Plot 
with(week1data, plot(datetime, sub_metering_1, xlab = '', 
                     ylab = 'Energy sub metering', type = 'l'))
lines(week1data$datetime, week1data$sub_metering_2, col = 'red')
lines(week1data$datetime, week1data$sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), 
       legend = c('sub_metering_1', 'sub_metering_2', 'sub_metering_3'))
#Close device
dev.off()



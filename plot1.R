#Plot1

#Download data and unzip
if(!file.exists("./Exploratory_Data_Analysis")) 
{dir.create("./Exploratory_Data_Analysis")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./Exploratory_Data_Analysis/Electric_power_consumption.zip")
unzip(zipfile = "./Exploratory_Data_Analysis/Electric_Power_Consumption.zip")

#Read data
week1data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
names(week1data) <- tolower(names(week1data))
week1data$date <- as.Date(week1data$date, '%d/ %m/ %Y')
week1data$datetime <- as.POSIXct(paste(week1data$date, week1data$time))
week1data <- subset(week1data, date == '2007-02-01' | date == '2007-02-02')
                         
#Open device
if(!file.exists('plots')) {dir.create('plots')}
png(filename = './plots/plot1.png', width = 480, height = 480, units = 'px')

#Plot 
with(week1data, hist(global_active_power, 
                     xlab = 'Global Active Power (kilowatt)',
                     main = 'Global Active Power', col = 'red'))

#Close device
dev.off()

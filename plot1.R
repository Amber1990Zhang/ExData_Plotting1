#Plot1

#Download data and unzip
if(!file.exists("./Exploratory_Data_Analysis")) 
{dir.create("./Exploratory_Data_Analysis")}
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "./Exploratory_Data_Analysis/Electric_power_consumption.zip")
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
                         
#Open device
if(!file.exists('plots')) {dir.create('plots')}
png(filename = './plots/plot1.png', width = 480, height = 480, units = 'px')

#Plot 
with(week1data, hist(global_active_power, 
                     xlab = 'Global Active Power (kilowatt)',
                     main = 'Global Active Power', col = 'red'))

#Close device
dev.off()

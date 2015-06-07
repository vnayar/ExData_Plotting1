# Downloading the file.
fileName = "household_power_consumption.zip"
if (!file.exists(fileName)) {
  message("Downloading file...")
  download.file(
      "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      "household_power_consumption.zip", method="curl")
  message("Decompressing file...")
  unzip("household_power_consumption.zip")
}

# Read the data.
message("Loading from file...")
household = read.table("household_power_consumption.txt", sep=";", header=TRUE,
    colClasses=c("character", "character", rep("numeric", times=7)), na.strings=c("?"))

# Convert the time from character to POSIXlt.
message("Formatting time...")
household$DateTime = strptime(paste(household$Date, household$Time), format="%d/%m/%Y %H:%M:%S")

# Filter out all the data except the two days we want.
message("Filtering by time range")
household = household[
      household$DateTime >= as.POSIXlt("2007-02-01")
      & household$DateTime < as.POSIXlt("2007-02-03"), ]

# Initialize our data if necessary.
if (!exists("household")) {
  source("loadData.R")
}

png(filename="plot1.png", width=480, height=480)

# Plot a histogram.
hist(
  household[["Global_active_power"]],
  main="Global Active Power",
  xlab="Global Active Power (kilowatts)",
  col="red")

dev.off()

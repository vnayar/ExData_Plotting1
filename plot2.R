# Initialize our data if necessary.
if (!exists("household")) {
  source("loadData.R")
}

png(filename="plot2.png", width=480, height=480)

# Plot a line graph of time vs. Global Active Power.
with(household,
  plot(
    DateTime, Global_active_power,
    ylab="Global Active Power (kilowatts)",
    type="l", xlab=NA))
  
dev.off()

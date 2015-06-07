# Initialize our data if necessary.
if (!exists("household")) {
  source("loadData.R")
}

png(filename="plot4.png", width=480, height=480)

# A 2x2 grid of plots.
par(mfcol=c(2, 2))
with(household, {
  # Plot 1: Global Active Power
  plot(
      DateTime, Global_active_power,
      ylab="Global Active Power",
      type="l", xlab=NA)
  # Plot 2: Energy sub metering
  plot(
      DateTime, Sub_metering_1,
      ylab="Energy sub metering",
      type="l", xlab=NA)
  lines(
      DateTime, Sub_metering_2,
      col="red")
  lines(
      DateTime, Sub_metering_3,
      col="blue")
  legend("topright", lwd=1, col=c("black", "red", "blue"), bty="n",
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # Voltage
  plot(DateTime, Voltage, xlab="datetime", type="l")
  # Global_reactive_power
  plot(DateTime, Global_reactive_power, xlab="datetime", type="l")
})

dev.off()

# Initialize our data if necessary.
if (!exists("household")) {
  source("loadData.R")
}

png(filename="plot3.png", width=480, height=480)

# Plot a line graph of:
#   Time vs. Sub_metering_1
#   Time vs. Sub_metering_2
#   Time vs. Sub_metering_3
with(household, {
  plot(
      DateTime, Sub_metering_1,
      ylab="Energy sub metering",
      xlab=NA,
      type="l")
  lines(
      DateTime, Sub_metering_2,
      col="red")
  lines(
      DateTime, Sub_metering_3,
      col="blue")
  legend("topright", lwd=1, col=c("black", "red", "blue"),
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})  

dev.off()

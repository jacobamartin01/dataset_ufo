# Mike Colbert
# 11/07/2023
# Integrate monthly UFO data into a single file

rm(list=ls())

# Load libraries
library(readr)

csv_files <- list.files(pattern = ".csv")

combined_data <- data.frame()

for (file in csv_files) {
  data <- read.csv(file)
  combined_data <- rbind(combined_data, data)
}

combined_data$date <- as.Date(combined_data$date, format = "%m/%d/%Y %H:%M")
combined_data$report_date <- as.Date(combined_data$report_date, format = "%m/%d/%Y")
combined_data$posted_date <- as.Date(combined_data$posted_date, format = "%m/%d/%Y")

str(combined_data)

# Save the combined data to a CSV file with UTF-8 encoding and without row numbers
write.csv(combined_data, "ufo_sightings.csv", row.names = FALSE, fileEncoding = "UTF-8")



#### Preamble ####
# Purpose: Clean dataset by removing unnecessary columns and renaming columns
# Author: Shirley Chen
# Date: January 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)
library(here)
library(janitor)
library(opendatatoronto)

raw_crime_data <- 
  read_csv(
    file = here("inputs/data/raw_crime_data.csv"),
    show_col_types = FALSE,
    skip = 0
  )


cleaned_crime_data <-
  clean_names(raw_crime_data)

# Remove unecessary columns
cleaned_crime_data <-
  subset(cleaned_crime_data, select = -c(id, event_unique_id, report_date,
                                         report_year, report_month,
                                         report_day, report_doy,
                                         report_hour, hood_158,
                                         report_dow,occ_date, offence,
                                         ucr_code,ucr_ext, hood_140,
                                         division, neighbourhood_140, 
                                         location_type))
# Keep years 2019-2023
selected_years <- c("2019", "2020", "2021", "2022", "2023")
cleaned_crime_data <- cleaned_crime_data |>
  filter(occ_year %in% selected_years)

# Rename columns to better understand
cleaned_crime_data <- cleaned_crime_data |>
  rename(
    year = occ_year,
    month = occ_month,
    day = occ_day,
    day_of_year = occ_doy,
    day_of_week = occ_dow,
    hour_of_occurrence = occ_hour, 
    offence_type = mci_category
  )

# Cleaned CSV
write_csv(
  x = cleaned_crime_data,
  file = "cleaned_crime_data.csv"
)

cleaned_crime_data

#### Data Testing ####
# Check that the year range is 2019-2023
cleaned_crime_data$year |> 
  min() == 2019
cleaned_crime_data$year |> 
  max() == 2023


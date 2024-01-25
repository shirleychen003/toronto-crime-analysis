#### Preamble ####
# Purpose: Simulate data of Toronto crime offences
# Author: Shirley Chen
# Date: January 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Datasets:
# - https://open.toronto.ca/dataset/major-crime-indicators/

#### Workspace Setup ####
install.packages("tidyverse")
install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

#### Simulate most popular crime by neighbourhood ####
# Based code off of https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate

simulated_crime_data <-
  tibble(
    # Use 1 through to 158 to represent each neighbourhood
    "neighbourhood" = 1:158,
    # Randomly pick an option, with replacement, 158 times
    "crime" = sample(
      x = c("Assault", "Robbery", "Homicide", "Break and Enter", "Other"),
      size = 158,
      replace = TRUE
    )
  )

simulated_crime_data


#### Simulate sum of monthly offences and most occurred offence ####
simulated_summed_monthly_data <-
  tibble(
    # Months of the year
    months = c("January", "February", "March", "April", "May", "June",
               "July", "August", "September", "October", "November",
               "December"),
    sum_values = c(546, 135, 634, 864, 249, 8564, 1094, 1234, 532, 632,
                   135, 153),
    most_occurred_offence = c("Assault", "Assault", "Robbery", "Robbery",
                              "Robbery","Robbery", "Homicide", "Break and
                              Enter", "Break and Enter" , "Other",
                              "Break and Enter", "Other")
  )
simulated_summed_monthly_data


#### Simulate sum of annual offences from 2019 - 2023 ####
simulated_summed_annual_data <-
  tibble(
    years = c(2019, 2020, 2021, 2022, 2023),
    sum_values = c(190983, 102873, 210384, 203893, 231033)
  )
simulated_summed_annual_data


#### Simulate bar graph of most crimes by weekday ####
# Code based off http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization and https://guslipkin.medium.com/reordering-bar-and-column-charts-with-ggplot2-in-r-435fad1c643e

# Create Dataframe
weekday_dataframe <- data.frame(
  day=c("Sunday","Monday","Tuesday","Wednesday","Thursday",
        "Friday","Saturday"), 
  offense_count=c(25,22,30,34,38,27, 29)
)

weekday_graph <-ggplot(weekday_dataframe, aes(x=factor(day, day), y=offense_count)) +
  geom_bar(stat="identity", fill="blue")

weekday_graph



#### Data Testing ####

# Check that there are between 1 and 158 neighbourhoods #
# Based code off of https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate
simulated_crime_data$neighbourhood |> min() == 1
simulated_crime_data$neighbourhood |> max() == 158

# Check the offence types 
simulated_summed_monthly_data$most_occurred_offence |>
  unique() == c("Assault", "Assault", "Robbery", "Robbery", "Robbery",
                "Robbery", "Homicide", "Break and Enter", "Break and Enter", 
                "Other","Break and Enter", "Other")

# Check number of offence types
simulated_crime_data$crime |>
  unique() |>
  length() == 5

# Check year range
simulated_summed_annual_data$years |> 
  min() == 2019
simulated_summed_annual_data$years |> 
  max() == 2023

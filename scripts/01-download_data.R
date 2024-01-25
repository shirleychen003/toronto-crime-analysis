#### Preamble ####
# Purpose: Download data from the OpenDataToronto portal to make accessible
# Author: Shirley Chen
# Date: January 2024
# Contact: sshirleyy.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("readr")
library(opendatatoronto)
library(tidyverse)
library(readr)

#### Acquire data ####
# Based on code from https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate-2
raw_crime_data <-
  read_csv(file = "toronto-crime-analysis/inputs/data/raw_crime_data.csv", 
           show_col_types = FALSE)

write_csv(x = raw_crime_data, file = "raw_crime_data.csv")

raw_crime_data

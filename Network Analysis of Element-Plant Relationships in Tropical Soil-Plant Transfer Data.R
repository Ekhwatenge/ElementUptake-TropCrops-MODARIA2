# Install required packages if not already installed
if (!require("igraph")) install.packages("igraph")
if (!require("tidyverse")) install.packages("tidyverse")
# Install packages if not already installed
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("igraph")) install.packages("igraph")

# Load the packages
library(tidyverse)  # Loads dplyr, readr, ggplot2, etc.
library(igraph)


library(tidyverse)
library(igraph)

# Define column names as per the dataset documentation
col_names <- c(
  "Record", "Element", "Radionuclide", "Common_name", "Latin_name", "Compartment", "CR", "Uncert_CR", "N_CR",
  "Min_CR", "Max_CR", "C_plant", "Uncert_C_plant", "N_plant", "C_soil", "Uncert_C_soil", "N_soil",
  "Country", "Site", "K_G_class", "Contamination", "Experiment", "Year", "Growth_stage", "Dry_fraction",
  "Preparation", "Soil_depth", "Texture", "Sand", "Silt", "Clay", "OM", "Exch_K", "Exch_Ca", "Exch_Mg",
  "CEC", "pH", "QC_meas", "QC_sampl", "QC_equip", "Reference"
)

# Read the CSV file (replace with your file path if needed)
df <- read.csv("iaea-modaria-ii-tropical-dataset.csv", col_names = col_names)

# Preview the data
head(df)


# Keep only rows with valid Element, Latin_name, and CR
df_clean <- df %>%
  select(Element, Latin_name, Common_name, Compartment, CR) %>%
  filter(!is.na(Element), !is.na(Latin_name), !is.na(CR))

# Convert CR to numeric
df_clean <- df_clean %>% mutate(CR = as.numeric(CR))
df_clean <- df_clean %>% filter(!is.na(CR), CR > 0)

head(df_clean)


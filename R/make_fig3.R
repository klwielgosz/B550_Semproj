#! /usr/local/bin/Rscript.exe

### IMPORTANT: Set directory for data on github
git_dat <- "https://raw.githubusercontent.com/pzhan56/B550_Semproj/master/raw_data/INFO550_Semproj_dat.csv"
git_dict <- "https://raw.githubusercontent.com/pzhan56/B550_Semproj/master/raw_data/Data_Dictionary.csv"
git_medicare <- "https://raw.githubusercontent.com/pzhan56/B550_Semproj/master/raw_data/Medicare_segmentation_values.csv"

### Packages
library(dplyr)
library(tidyselect)
library(tidyverse)
library(ggplot2)
library(stringr)
library(furniture)
library(knitr)
library(readr)

# ------------------- Import Data ----------------------- #
# Raw data
dat <-read_csv(git_dat) %>%
  mutate(loneliness_issues = as.factor(loneliness_issues))

# ------------------- Make figure 1 ----------------------- #
# Plot age density by RUCC category
png("figs/fig3.png")

# Change density plot line colors by groups
ggplot(dat, aes(x=est_age, color=state_cd)) +
  geom_density()
# Add mean lines
p <-ggplot(dat, aes(x=est_age, color=state_cd)) +
  geom_density() +
  
  labs(title="Age Density by State",x="Age(yrs", y = "Density")
p

dev.off()


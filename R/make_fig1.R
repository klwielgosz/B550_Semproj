#! /usr/local/bin/Rscript.exe

# data_merge <- read.table("clean_data/clean_data.txt", header = TRUE)
# 
# # plot of biom1 by age and biom2 by age
# png("figs/fig1.png")
# layout(t(1:2))
# plot(y = data_merge$biom1, x = data_merge$age,
#      xlab = "Age", ylab = "Biomarker 1",
#      col = data_merge$sexf + 1, pch = 19)
# legend(title = "Sex", col = c(1, 2), 
#        legend = c("Male", "Female"),
#        pch = 19,
#        x = "topleft")
# plot(y = data_merge$biom2, x = data_merge$age,
#      xlab = "Age", ylab = "Biomarker 2",
#      col = data_merge$sexf + 1, pch = 19)
# dev.off()


### IMPORTANT: Set directory for data on github
git_dat <- "https://raw.githubusercontent.com/pzhan56/B550_Semproj/master/raw_data/B550_Dat.csv"
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
# Variable definitions
var_def <- read_csv(git_dict)
# Medicare Segmentation values
Medicare_def <- read_csv(git_medicare)

### Create summary table of demographics within this dataset

### Make a table with several variables, test if they are equal
Pred_vars <- str_c(names(dat), collapse = ", ")

demo_table1_raw <- table1(dat,
                          est_age, sex_cd, lang_spoken_cd, mabh_seg, rucc_category, state_cd
                          ,splitby = ~loneliness_issues
                          ,row_wise = T,
                          na.rm=F,
                          test = TRUE,
                          type="full")

demo_table1 <- as.data.frame(demo_table1_raw)
demo_table2 <- demo_table1 %>%
        rename(Characteristic = ".", "No Loneliness Issues" = "0" ,"Loneliness Issues" = "1" )

kable(demo_table1)

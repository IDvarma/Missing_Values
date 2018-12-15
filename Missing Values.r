#-------------------------------
#title: "Missing Values"
#author: "Dinesh Varma Indukuri"
#date: "14 December 2018"
#output: html_document
#--------------------------------

#Importing libraries

library(tidyverse)
library(dplyr)

#Read csv file into dataframe
df <- read_csv(file = "C://Users/idv_1/Downloads/property data.csv")

#Preview of data
df

#Eliminating unnecessary columns
df <- df %>% select (-PID,-NUM_BATH,-SQ_FT)
df

#Looking at ST_NUM column
df$ST_NUM
is.na(df$ST_NUM)

#Looking at NUM_BEDROOMS
df$NUM_BEDROOMS
is.na(df$NUM_BEDROOMS)


#Making a list of missing values & Re-importing data
missing_values = c("na","NA","n/a","","-")
df1<- read_csv(file = "C://Users/idv_1/Downloads/property data.csv",na = missing_values)
df1<- df1 %>% select(-PID,-NUM_BATH,-SQ_FT)
df1

#Looking at NUM_BEDROOMS column
df1$NUM_BEDROOMS
is.na(df1$NUM_BEDROOMS)

#Dealing Numeric values (Unexpected Missing Values)
tmp <- as.numeric(tolower(df1$OWN_OCCUPIED)=="y")
tmp <- tmp + as.numeric(tolower(df1$OWN_OCCUPIED)=="n")
df1$OWN_OCCUPIED <- ifelse(tmp==1,df1$OWN_OCCUPIED,NA)
df1

#Summarizing the missing values
sum(as.numeric(is.na(df1)))
# 7

#Replacing missing values with number
df1$ST_NUM[is.na(df1$ST_NUM)] <- 125
df1

#Replace using median
df1$NUM_BEDROOMS[is.na(df1$NUM_BEDROOMS)] <- median(df1$NUM_BEDROOMS,na.rm = TRUE)
df1
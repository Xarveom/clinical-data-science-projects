install.packages("dplyr")
install.packages("tidyr")
install.packages("readr")

library(dplyr)
library(tidyr)
library(readr)

covid<-read_csv("D:/R Programming/data/owid-covid-data.csv")

#explore the data
head(covid)
glimpse(covid)
summary(covid)
unique(covid$continent)

#clean the data

Covid_clean<- covid %>%
  select(location, continent, date, total_cases, total_deaths)

#filter valid rows(remove missing continent and total  cases)

Covid_clean<-Covid_clean%>%
  filter(!is.na(continent),!is.na(total_cases))

#get the latest date in the dataset

latest_date<-max(Covid_clean$date)
print(latest_date)

#summarize total cases and deaths by continent

covid_latest <- Covid_clean %>%
  filter(date == latest_date) %>%
  group_by(continent) %>%
  summarise(
    total_cases = sum(total_cases,na.rm = TRUE),
    total_deaths=sum(total_deaths, na.rm = TRUE)
  )

#reshape into long format for plotting 

covid_tidy <- covid_latest %>%
  pivot_longer(cols = c(total_cases,total_deaths),
               names_to = "metric",
               values_to = "count")



# 🧪 Clinical Data Science Projects

This repository showcases my applied work in clinical and public health data analysis using R.

---

## 📁 01_gapminder_eda

Exploratory analysis of health and economic trends using the `gapminder` dataset.

### 🔍 Objective
To investigate patterns in life expectancy, GDP per capita, and population across continents and over time.

### 📦 Tools & Libraries
- `dplyr` for data manipulation
- `ggplot2` for data visualization
- Base R for initial exploration

### 📊 Key Analysis
- Mean life expectancy by continent
- GDP and life expectancy trends over years
- Visualizations: boxplot, line chart, scatter plot

---

## 📂 Files

| File               | Description                        |
|--------------------|------------------------------------|
| `gapminder_eda.R`  | R script with analysis and plots   |
| `plots/`           | Folder containing saved visualizations |

---

## 🧪 02: COVID-19 Data Wrangling & Summary

This project analyzes global COVID-19 data from [Our World in Data](https://ourworldindata.org/coronavirus) using `dplyr`, `tidyr`, and `readr` in R.

### 🔍 Key Steps:
- Loaded the `owid-covid-data.csv` dataset
- Cleaned the data to select `location`, `continent`, `date`, `total_cases`, and `total_deaths`
- Filtered to include only valid continent-level records
- Summarized total cases and deaths by continent for the most recent date

### 📊 Sorting by Total Cases
To identify the continent with the highest total cases, the following code was used:

```r
covid_latest %>%
  arrange(desc(total_cases))


## 👨‍💻 Author
**Christy Joseph** 
MSc Data Science (UK) | Base SAS Certified  
Clinical data enthusiast exploring analytics, visualization, and reporting using R.
[LinkedIn](https://www.linkedin.com/in/christy-joseph-b6b0051ba/)

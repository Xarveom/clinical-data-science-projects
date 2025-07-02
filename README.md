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


##  03 📄 Project: COVID-19 Testing Data Scraping and Preprocessing

**Notebook:** `final_jupyter_covid19.ipynb`

This R-based project demonstrates how to extract COVID-19 testing data by country from Wikipedia using web scraping techniques, and perform basic data preprocessing for analysis.

### 📌 Key Tasks Performed

- Sending an HTTP GET request using the `httr` package
- Reading HTML content with `rvest`
- Extracting the second table from the Wikipedia page on COVID-19 testing by country
- Converting the HTML table into an R data frame
- Cleaning the data (e.g., removing rows like “World” and the last summary row)
- Providing a summary of the cleaned dataset

### 🌐 Data Source

- Wikipedia: [`COVID-19 testing by country`](https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country)

### 🛠️ Libraries Used

- `httr` – for making HTTP requests
- `rvest` – for parsing HTML content


### 🛠️ Tools & Libraries Used

- R programming language
- `httr` — for making HTTP requests
- `rvest` — for parsing and scraping HTML tables


### 🧪 Tasks Covered in Notebook

1. Send an HTTP GET request to fetch the Wikipedia page
2. Parse and extract the main `<table>` containing testing data
3. Convert the HTML table into a usable R data frame
4. Perform data wrangling and cleanup
5. Rank countries by total tests, tests per capita, or positivity rate



## 👨‍💻 Author
**Christy Joseph** 
MSc Data Science (UK) | Base SAS Certified  
Clinical data enthusiast exploring analytics, visualization, and reporting using R.
[LinkedIn](https://www.linkedin.com/in/christy-joseph-b6b0051ba/)

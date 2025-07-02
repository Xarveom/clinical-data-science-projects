# This lab requires 'httr' and 'rvest'packages, which are already pre-loaded into this lab environment.
# However, if you are working on your local RStudio, please uncomment the below codes and install the packages.

install.packages("httr" )
install.packages("rvest")

library(httr)
library(rvest)


get_wiki_covid19_page <- function() {
    
  # Our target COVID-19 wiki page URL is: https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country  
  # Which has two parts: 
    # 1) base URL `https://en.wikipedia.org/w/index.php  
    # 2) URL parameter: `title=Template:COVID-19_testing_by_country`, seperated by question mark ?
    
  # Wiki page base
  wiki_base_url <- "https://en.wikipedia.org/w/index.php"
  # You will need to create a List which has an element called `title` to specify which page you want to get from Wiki
  # in our case, it will be `Template:COVID-19_testing_by_country`
    list_t <- list(title='Template:COVID-19_testing_by_country')
 
  # - Use the `GET` function in httr library with a `url` argument and a `query` arugment to get a HTTP response

    res<- GET(wiki_base_url, query=list_t)
  # Use the `return` function to return the response
return(res)
}




# Call the get_wiki_covid19_page function and print the response
resp<-get_wiki_covid19_page()
print(resp)

# Get the root html node from the http response in task 1 
root_node <- read_html(resp)
root_node


# Get the table node from the root html node
table_node <- html_nodes(root_node, "table")
table_node

# Read the table node and convert it into a data frame, and print the data frame for review
data_frame<-html_table(table_node[[2]],fill=TRUE)
head(data_frame)

# Print the summary of the data frame
summary(tdf)

preprocess_covid_data_frame <- function(data_frame) {
    
    shape <- dim(data_frame)

    # Remove the World row
    data_frame<-data_frame[!(data_frame$`Country or region`=="World"),]
    # Remove the last row
    data_frame <- data_frame[1:172, ]
    
    # We dont need the Units and Ref columns, so can be removed
    data_frame["Ref."] <- NULL
    data_frame["Units[b]"] <- NULL


    # Renaming the columns
    names(data_frame) <- c("country", "date", "tested", "confirmed", "confirmed.tested.ratio", "tested.population.ratio", "confirmed.population.ratio")
    
    # Convert column data types
    data_frame$country <- as.factor(data_frame$country)
    data_frame$date <- as.factor(data_frame$date)
    data_frame$tested <- as.numeric(gsub(",","",data_frame$tested))
    data_frame$confirmed <- as.numeric(gsub(",","",data_frame$confirmed))
    data_frame$'confirmed.tested.ratio' <- as.numeric(gsub(",","",data_frame$`confirmed.tested.ratio`))
    data_frame$'tested.population.ratio' <- as.numeric(gsub(",","",data_frame$`tested.population.ratio`))
    data_frame$'confirmed.population.ratio' <- as.numeric(gsub(",","",data_frame$`confirmed.population.ratio`))
    
    return(data_frame)
}


# call `preprocess_covid_data_frame` function and assign it to a new data frame
tdf_clean<-preprocess_covid_data_frame(data_frame)
head(tdf_clean)


# Print the summary of the processed data frame again
summary(tdf_clean)

# Export the data frame to a csv file
write.csv(tdf_clean,"Covid.csv",row.names=FALSE)

getwd()

# Get working directory
wd <- getwd()
# Get exported 
file_path <- paste(wd, sep="", "/Covid.csv")
# File path
print(file_path)
file.exists(file_path)

## Download a sample csv file
#covid_csv_file <- download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/covid.csv", destfile="covid.csv")
# covid_data_frame_csv <- read.csv("covid.csv", header=TRUE, sep=",")

# Read covid_data_frame_csv from the csv file
covid_data_frame_csv<- read.csv("Covid.csv")
# Get the 5th to 10th rows, with two "country" "confirmed" columns
covid_data_frame_csv[5:10, c("country", "confirmed")]

# Get the total confirmed cases worldwide
total_confirm<- sum(covid_data_frame_csv$confirmed)
total_confirm
# Get the total tested cases worldwide
total_tested<- sum(covid_data_frame_csv$tested)
total_tested
# Get the positive ratio (confirmed / tested)
positive_ratio<- total_confirm/total_tested
positive_ratio

# Get the `country` column
countries_df <- covid_data_frame_csv[ , c("country")]
# Check its class (should be Factor)
class(countries_df)

# Conver the country column into character so that you can easily sort them

# Sort the countries AtoZ
sort_countriesaz<-sort(countries_df)
# Sort the countries ZtoA
sort_countriesza<-sort(countries_df,decreasing=TRUE)
# Print the sorted ZtoA list
print(sort_countriesza)

# Use a regular expression `United.+` to find matches
united_match<-grep("United.+",countries_df,value=TRUE)
# Print the matched country names
print(united_match)

# Select a subset (should be only one row) of data frame based on a selected country name and columns
UKrow <- covid_data_frame_csv[covid_data_frame_csv== "United Kingdom",]

# Select a subset (should be only one row) of data frame based on a selected country name and columns
Germanrow <- covid_data_frame_csv[ covid_data_frame_csv$country == "Germany",]

# Use if-else statement
 if (UKrow$confirmed.population.ratio>Germanrow$confirmed.population.ratio) {
   print("UK has a higher confirmed-to-population ratio than Germany")
 } else {
    print("Germany has a higher confirmed-to-population ratio than UK")
 }


# Get a subset of any countries with `confirmed.population.ratio` less than the threshold
low_risk_countries <- covid_data_frame_csv[covid_data_frame_csv$confirmed.population.ratio < 0.01, ]
print(low_risk_countries)



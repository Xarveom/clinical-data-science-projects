install.packages("gapminder")
Install.packages("ggplot2")
install.packages("dplyr")

library(gapminder)
library(ggplot2)
library(dplyr)

#view first few rows
head(gapminder)

#structure and summary

str(gapminder)
summary(gapminder)

#average life expectancy by continent

gapminder %>%
  group_by(continent) %>%
  summarise(mean_lifeExp = mean(lifeExp))

#line plot of Global Life Expectancy Over Time

gapminder %>%
  group_by(year) %>%
  summarise(mean_lifeExp = mean(lifeExp)) %>%
  ggplot(aes(x = year, y = mean_lifeExp))+
  geom_line(color = "blue", size = 1)+
  labs(title = "Global Life Expectancy Over Time", y = "Life Expectancy")

#boxplot of Life Expectancy by Continent

ggplot(gapminder, aes(x = continent, y = lifeExp))+
  geom_boxplot(fill = "lightgreen")+
  labs(title = "Life Expectancy by Continent")

#Scatter Plot: GDP vs Life Expectancy

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent))+
  geom_point(alpha =0.6)+
  scale_x_log10()+
  labs(title = "Life Expectancy vs GDP per Capita", x= "GDP per Capita (log scale)")
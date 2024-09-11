### Ruijian Lin ###

### Homework 2                                         ###
### GGPlot Basics ###

#Put your code in this file. Make sure you assign the relevant values to the correct variable names, which are given below. 
#Uncomment the variables as you assign your final values/functions/results to them.

library(dplyr)
library(tidyr)
library(tibble)
library(ggplot2)
library(stringr)# This loads the packages necessary to run your plots. Do not delete or comment this out.


### Exercise 1
# Step 1
sp500_data <- read.csv("SPX-1Month")

# Step 2
spx_plot1 <- ggplot(sp500_data, aes(x = Date, y = Close.Last, group = 1)) +
  geom_line() +
  geom_point()
spx_plot1

# Step 3
spx_plot2 <- spx_plot1 +
  labs(title = "S&P500 – Closing Price over the Last Month", 
       y = "Price", x = "Date") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
spx_plot2

### Exercise 2
book_data <- read.csv("BookGenres")

bookplot <- ggplot(book_data, aes(x = Category, y = Price, color = Season)) +
  geom_jitter(alpha = 0.40, width = 0.2) +
  labs(title = "The Price of Fiction Books by Genre and Season",
       x = "Genre", y = "Price ($)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))
bookplot

### Exercise 3
squirrel_data <- read.csv("squirrel")

squirrelPlot <- ggplot(squirrel_data, aes(x = Activities, fill = Interactions.with.Humans)) +
  geom_bar(position = "dodge") +
  labs(title = "Squirrel Behavior in NYC Parks", 
       x = "Squirrel's Activity during Observation", 
       y = "Count", fill = "Interaction with Humans") +
  theme_grey() 

squirrelPlot

### Exercise 4
bigMac_data <- read.csv("big_mac")

bigMac <- ggplot(bigMac_data, aes(x = as.numeric(GDP.Per.Capita), y = dollar_price)) +
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index", 
       y = "Dollar Price of a Big Mac", x = "GDP per Capita in Dollars") +
  geom_smooth(method="loess", se = TRUE) +
  geom_point()
bigMac

logBigMac <- ggplot(bigMac_data, aes(x = log(as.numeric(GDP.Per.Capita)), y = dollar_price)) +
  labs(title = "Countries' GDP Per Capita compared to their Big Mac Index", 
       y = "Dollar Price of a Big Mac", x = "Log of Dollar GDP Per Capita") +
  geom_smooth(method="loess", se = TRUE) +
  geom_point()
logBigMac

---
title: 'Lesson 4: Annotating and Saving'
output: html_document
---
## Background for this activity
#In this activity, youâ€™ll review a scenario, and practice adding annotations 
#to a data visualization with ggplot2. You will also learn how to save images 
#from ggplot2 visualizations so that you can add them directly to presentations. 
#Throughout this activity, you will also have the opportunity to practice 
#writing your own code by making changes to the code chunks yourself. If you 
#encounter an error or get stuck, you can always check the 
#Lesson4_Annotations_Solutions .rmd file in the Solutions folder under Week 4 
#for the complete, correct code. 

## The Scenario
#As a junior data analyst for a hotel booking company, you have been creating 
#visualizations in `R` with the `ggplot2`  package to share insights about your 
#data with stakeholders. After creating a series of visualizations using 
#`ggplot()`, `ggplot2` aesthetics, and filters, your stakeholder asks you to 
#add annotations to your visualizations to help explain your findings in a 
#presentation. Luckily, `ggplot2` has annotation functions built in.  

## Step 1: Import your data
bookings <- read.csv("hotel_bookings.csv")

## Step 2: Refresh Your Memory
head(bookings)
colnames(bookings)

## Step 3: Install and load the 'ggplot2' and 'tidyverse' packages (optional)
install.packages("ggplot2")
install.packages("tidyverse")
library(ggplot2)
library(tidyverse)

## Step 4: Annotating your chart
#Your stakeholder tells you that they would like you to share they visualization 
#breaking down payment type by city because it will help inform how the company 
#targets promotions in the future. They ask you to create a cleaned and labeled 
#version and save it as a .png file for them to include in a presentation. 
ggplot(data = bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel)

#This creates two bar graphs: one for 'city_hotel' data and one for 
#'resort_hotel' data. The x axis is 'market_segment' and the y axis is 'count' 
#for both charts. 
#In this visualization it is unclear where the data is from, what the main 
#takeaway is, or even what the data is showing. To explain all of that, you can 
#leverage annotations in `ggplot2`.
#The first step will be adding a title; that is often the first thing people 
#will pay attention to when they encounter a data visualization for the first 
#time. To add a title, you will add `labs()` at the end of your `ggplot()` 
#command and then input a title there. Add a descriptive title to the code 
#chunk below: 

ggplot(data=bookings)+
  geom_bar(mapping = aes(x=market_segment))+
  facet_wrap(~hotel)+
  labs(title=" ")

#add another detail about what time period this data covers. To do this, you 
#need to find out when the data is from. You realize you can use the `min()` 
#function on the year column in the data

mindate <- min(bookings$arrival_date_year)
maxdate <- max(bookings$arrival_date_year)

#you can use the `paste0()` function to use your newly-created variables in your labels
ggplot(data=bookings)+
  geom_bar(mapping = aes(x=market_segment))+
  facet_wrap(~hotel)+
  theme(axis.title.x = element_text(angle=45))+
  labs(title="Comparision of market segments by hotel type for hotel bookings",
       subtitle=paste0("Data from: ", mindate, " to ", maxdate))

#You realize that this chart is displaying the technical details a little too 
#prominently. You don't want that to be the second thing people notice during 
#the presentation. You decide to switch the `subtitle`  to a `caption` which 
#will appear in the bottom right corner instead.

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate))

#Now you want to clean up the x and y axis labels to make sure they are really clear.

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = market_segment)) +
  facet_wrap(~hotel) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(title="Comparison of market segments by hotel type for hotel bookings",
       caption=paste0("Data from: ", mindate, " to ", maxdate),
       x="Market Segment",
       y="Number of Bookings")

## Step 5: Saving your chart
ggsave('hotel_booking_chart.png')



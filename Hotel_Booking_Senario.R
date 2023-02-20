## The Scenario
#In this example, you are a junior data analyst working for the same hotel 
#booking company from earlier. Last time, you created some simple visualizations 
#with `ggplot2` to give your stakeholders quick insights into your data. Now, 
#you are are interested in creating visualizations that highlight different 
#aspects of the data to present to your stakeholder. You are going to expand on 
#what you have already learned about `ggplot2` and create new kinds of 
#visualizations like bar charts.  

## Step 1: Import your data
bookings <- read.csv("hotel_bookings.csv")

## Step 2: Refresh Your Memory
head(bookings)
colnames(bookings)

## Step 3: Install and load the 'ggplot2' package (optional)
install.packages("ggplot2")
library(ggplot2)

## Step 4: Making a Bar Chart
ggplot(data=bookings)+
  geom_bar(mapping = aes(x=distribution_channel))

## Practice quiz
#Use the bar chart you created to answer this question: what distribution type 
#has the most number of bookings? Note your answer for the practice quiz 
#question in Coursera afterwards.

## Step 5: Diving deeper into bar charts
ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel,fill=deposit_type))

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel,fill=market_segment))

## Step 6: Facets galore
ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type)

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~market_segment) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_grid(~deposit_type) +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data = bookings) +
  geom_bar(mapping = aes(x = distribution_channel)) +
  facet_wrap(~deposit_type~market_segment) +
  theme(axis.text.x = element_text(angle = 45))
# Exercise 5: dplyr grouped operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# What was the average department delay in each month?
# Save this as a data frame `dep.delay.by.month`
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.month <- flights %>%
  group_by(month) %>%
  summarize(delay = mean(dep_delay, na.rm = TRUE))
dep.delay.by.month
# Which month had the greatest average departure delay?
filter(dep.delay.by.month, delay == max(delay))

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# 'plot()' function
plot(dep.delay.by.month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
destination.with.delay <- flights %>%
  group_by(dest) %>%
  summarize(arrival.delays = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(-arrival.delays)
destination.with.delay

# You can look up these airports in the `airports` data frame!
filter(airports, faa == destination.with.delay$dest[1])

# Which city was flown to with the highest average speed?
city.by.speed <- flights %>% 
  mutate(speed = distance/air_time * 60) %>% 
  group_by(dest) %>%
  summarize(avg_speed = mean(speed, na.rm = TRUE)) %>%
  arrange(-avg_speed)
city.by.speed


# Exercise 4: practicing with dplyr

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
install.packages("dplyr")
library(dplyr)
install.packages("nycflights13")
library(nycflights13)

# The data.frame `flights` should now be accessible to you.
View(flights)
is.data.frame(flights)
# Use functions to inspect it: how many rows and columns does it have?
ncol(flights)
nrow(flights)
# What are the names of the columns?
colnames(flights)
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
?flights

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained in the air

flights <- mutate(flights, gained = arr_delay - dep_delay) %>% arrange(gained)
ncol(flights)
View(flights)
# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)

arrange(flights, -gained)
View(flights)
# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables and reload the library 
# to "reset" it.
flights <- mutate(flights, gained = arr_delay - dep_delay) %>% arrange(gained)

# Make a histogram of the amount of time gained using the `hist()` function
hist(flights$gained)

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
summarize(flights, mean = mean(gained, na.rm = TRUE))

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain" column you just created
to.sea <- flights %>% select(origin, dest, gained) %>%  filter(dest == 'SEA')

# On average, did flights to SeaTac gain or loose time?
summarize(to.sea, mean = mean(to.sea$gained, na.rm =TRUE))


# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!

filter(flights, origin=="JFK", dest=="SEA") %>%
  summarize(
    average.air.time = mean(air_time, na.rm = TRUE),
    max.air.time = max(air_time, na.rm = TRUE),
    min.air.time = min(air_time, na.rm = TRUE)
  )


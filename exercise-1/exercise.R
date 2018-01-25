# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)


# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)

# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
diff.manufactuers <- vehicles$make

# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
length(unique(diff.manufactuers))

# Filter the data set for vehicles manufactured in 1997
car1997 <- vehicles[vehicles$year == 1997, ]

# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function in the same way you would use the `max()`
# function. See also: 
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/

car1997[order(car1997$hwy), ]

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
car1997$average <- (car1997$cty + car1997$hwy) / 2

# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.

two.wheel.20.mpg <- vehicles[vehicles$drive == '2-']
# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.


# Write a function that takes a `year` and a `make` as parameters, and returns 
# the vehicle model that gets the most hwy miles/gallon of vehicles of that make
# in that year.
# You'll need to filter more (and do some selecting)!


# What was the most efficient Honda model of 1995?


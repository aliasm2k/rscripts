# Identify path to data file
data.path <- system.file('extdata', package='dslabs')
data.file <- 'life-expectancy-and-fertility-two-countries-example.csv'

# Load library readr
library(readr)

# Load dataset using read_csv function
data.wide <- read_csv(file.path(data.path, data.file))
head(data.wide)

data.tidy <- data.wide %>%
  gather(key, value, -country) %>%
  separate(key, c('year', 'variable_name'), extra='merge') %>%
  spread(variable_name, value)
head(data.tidy)

# Determine path to data file

data.path <- system.file('extdata', package='dslabs')
data.file <- 'fertility-two-countries-example.csv'

# Load dataset using readr
library(readr)
data.wide <- read_csv(file.path(data.path, data.file))
head(data.wide)

# Load library dplyr for pies and tidyr
library(dplyr)
library(tidyr)

data.tidy <- data.wide %>% gather(year, fertility, -country, convert=T)
head(data.tidy)

data.wide <- data.tidy %>% spread(year, fertility)
head(data.wide)

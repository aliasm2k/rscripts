# Load library dslabs for data
library(dslabs)

# Load reported heights datatset
data(reported_heights)
head(reported_heights)
tail(reported_heights)

# Load dplyr
library(dplyr)

# Check for na
reported_heights <- reported_heights %>%
  mutate(height.numeric=as.numeric(.$height)) %>%
  filter(is.na(.$height.numeric))
head(reported_heights)

# Function to check heights not in inches
not.inches <- function(x, height.min=50, height.max=84) {
  inches <- suppressWarnings(as.numeric(x))
  is.na(inches) | inches < height.min | inches > height.max
}

# Load library stringr
library(stringr)

# Subset heights matching various patterns
reported_heights$height %>% str_subset('cm')
reported_heights$height %>% str_subset('cm|inches')
reported_heights$height %>% str_subset('\\d')
reported_heights$height %>% str_subset('^[4-7]\'\\d{1,2}$')
reported_heights$height %>% str_subset('inches')
reported_heights$height %>% str_subset('\'\'')

reported_heights$height %>%
  str_replace('feet|ft|foot', '\'') %>%
  str_replace('inches|in|\'\'|\"', '') %>%
  str_subset('^[4-7]\\s*\'\\s*\\d{1,2}$')

reported_heights$height %>% str_extract('^([4-7]),(\\d*)$')
reported_heights$height %>% str_match('^([4-7]),(\\d*)$')
reported_heights$height %>% str_replace('^([4-7]),(\\d*)$', '\\1\'\\2')

reported_heights$height %>%
  str_subset('^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$') %>%
  str_replace('^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$', '\\1\'\\2')

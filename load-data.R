# Determine path to dataset
path.dslabs <- system.file('extdata', package='dslabs')
data.dslabs <- 'murders.csv'

# Sample lines from dataset
read_lines(file.path(path.dslabs, data.dslabs), n_max=3)

# Its CSV, using read_csv from readr
library(readr)
tibble.murders <- read_csv(file.path(path.dslabs, data.dslabs))
str(tibble.murders)

# Using R Base
frame.murders <- read.csv(file.path(path.dslabs, data.dslabs))
str(frame.murders)

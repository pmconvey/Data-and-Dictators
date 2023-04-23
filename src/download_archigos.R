# Download the "Archigos: A Database of Political Leaders" dataset

# Goemans, H. E., Gleditsch, K. S., & Chiozza, G. (2009).
# Introducing Archigos: A Dataset of Political Leaders.
# Journal of Peace Research, 46(2), 269–283.
# https://doi.org/10.1177/0022343308100719

library(here)
library(arrow)

archigos <- read.delim('http://ksgleditsch.com/data/1March_Archigos_4.1.txt')
arrow::write_parquet(archigos, here('data', 'archigos.parquet'))
# saving as a parquet file rather than a csv for the smaller file size and
# faster read speeds

# The codebook and case descriptions are available at
# https://rochester.edu/college/faculty/hgoemans/Archigos_4.1.pdf

elections <- read.csv('https://rochester.edu/college/faculty/hgoemans/Elections1900-2006-b.csv')
arrow::write_parquet(elections, here('data', 'archigos_elections.parquet'))
# "I completed collecting data on election dates for leaders in Archigos for
# the period 1919 - 2006 (in cvs format). The file contains data for the
# earlier period 1900 - 1918 but I do not claim this is comprehensive or
# complete. This data is not yet integrated in Archigos. I would appreciate
# feedback on omissions, mistakes and addenda. An effort is underway to
# upgrade and extend this data, this upgraded version should become available
# by the late Fall of 2009."
# - from https://rochester.edu/college/faculty/hgoemans/data.htm

rm(archigos, elections)

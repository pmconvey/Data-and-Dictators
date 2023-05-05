# Download the "Archigos: A Dataset of Political Leaders" dataset and save as
# parquet files for the smaller file size and faster read speeds.

# Goemans, H. E., Gleditsch, K. S., & Chiozza, G. (2009).
# Introducing Archigos: A Dataset of Political Leaders.
# Journal of Peace Research, 46(2), 269–283.
# https://doi.org/10.1177/0022343308100719

library(here)
library(arrow)

archigos <- read.delim('http://ksgleditsch.com/data/1March_Archigos_4.1.txt')
arrow::write_parquet(archigos, here('data', 'archigos.parquet'))


elections <- read.csv(paste0('https://rochester.edu/college/faculty/',
                             'hgoemans/Elections1900-2006-b.csv'))
arrow::write_parquet(elections, here('data', 'archigos_elections.parquet'))
# "I completed collecting data on election dates for leaders in Archigos for
# the period 1919 - 2006 (in cvs format). The file contains data for the
# earlier period 1900 - 1918 but I do not claim this is comprehensive or
# complete. This data is not yet integrated in Archigos. I would appreciate
# feedback on omissions, mistakes and addenda. An effort is underway to
# upgrade and extend this data, this upgraded version should become available
# by the late Fall of 2009."
# - from https://rochester.edu/college/faculty/hgoemans/data.htm

# Download the codebook and case descriptions
download.file('https://rochester.edu/college/faculty/hgoemans/Archigos_4.1.pdf',
              here('doc', 'Archigos_4.1.pdf'),
              mode = 'wb')

rm(archigos, elections)

sessionInfo()
# R version 4.2.2 (2022-10-31 ucrt)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 22621)
# 
# Matrix products: default
# 
# locale:
# [1] LC_COLLATE=English_United States.utf8 
# [2] LC_CTYPE=English_United States.utf8   
# [3] LC_MONETARY=English_United States.utf8
# [4] LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.utf8    
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets 
# [6] methods   base     
# 
# other attached packages:
#   [1] arrow_10.0.0 here_1.0.1  
# 
# loaded via a namespace (and not attached):
# [1] tzdb_0.3.0       rprojroot_2.0.3  assertthat_0.2.1
# [4] R6_2.5.1         magrittr_2.0.3   rlang_1.0.6     
# [7] cli_3.4.1        rstudioapi_0.14  vctrs_0.5.0     
# [10] tools_4.2.2      bit64_4.0.5      glue_1.6.2      
# [13] purrr_0.3.5      bit_4.0.4        compiler_4.2.2  
# [16] tidyselect_1.2.0
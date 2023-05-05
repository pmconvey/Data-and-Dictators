# Download the various files that are part of the "Rulers, Elections, and
# Irregular Governance (REIGN)" dataset and save as parquet files for the
# smaller file size and faster read speeds.

# Bell, Curtis, Besaw, Clayton., Frank, Matthew. 2021. The Rulers, Elections,
# and Irregular Governance (REIGN) Dataset. Broomfield, CO: One Earth Future.
# Available at https://oefdatascience.github.io/REIGN.github.io/

library(here)
library(arrow)

# reign <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
#                          'REIGN.github.io/gh-pages/data_sets/',
#                          'REIGN_2021_8.csv'))
# arrow::write_parquet(reign, here('data', 'reign.parquet'))
  # Tried this URL on 2023/04/23 and it does not work - get an error about
  # exceeding a file size of 20MB

reign_leaders <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
                                 'REIGN.github.io/gh-pages/data_sets/',
                                 'leader_list_8_21.csv'))
arrow::write_parquet(reign_leaders, here('data', 'reign_leaders.parquet'))

reign_elections <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
                                   'REIGN.github.io/gh-pages/data_sets/',
                                   'election_list_8_21.csv'))
arrow::write_parquet(reign_elections, here('data', 'reign_elections.parquet'))

reign_regimes <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
                                 'REIGN.github.io/gh-pages/data_sets/',
                                 'regime_list.csv'))
arrow::write_parquet(reign_regimes, here('data', 'reign_regimes.parquet'))

# Download the codebook
download.file(paste0('https://raw.githubusercontent.com/OEFDataScience/',
                     'REIGN.github.io/gh-pages/documents/REIGN_CODEBOOK.pdf'),
              here('doc', 'REIGN_CODEBOOK.pdf'),
              mode = 'wb')

# Download the technical notes
download.file(paste0('https://cdn.rawgit.com/OEFDataScience/',
                     'REIGN.github.io/gh-pages/documents/reign_notes.pdf'),
              here('doc', 'reign_notes.pdf'),
              mode = 'wb')

rm(reign, reign_leaders, reign_elections, reign_regimes)

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
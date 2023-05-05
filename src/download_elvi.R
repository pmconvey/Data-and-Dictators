# Download the files that are part of the "ELection VIolence (ELVI) Indicators
# and Forecast" dataset and save as parquet files for the smaller file size
# and faster read speeds.

# Besaw, Clayton., Frank, Matthew. 2021. ELection VIolence (ELVI) Indicators
# and Forecast Dataset. Broomfield, CO: One Earth Future.
# Available at https://oefdatascience.github.io/REIGN.github.io/

library(here)
library(arrow)

elvi_event <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
                              'REIGN.github.io/gh-pages/data_sets/',
                              'ELVI_2021_8.csv'))
arrow::write_parquet(elvi_event, here('data', 'elvi_events.parquet'))

elvi_forecast <- read.csv(paste0('https://cdn.rawgit.com/OEFDataScience/',
                                 'REIGN.github.io/gh-pages/data_sets/',
                                 'ELVI_FORECAST_2021_8.csv'))
arrow::write_parquet(elvi_forecast, here('data', 'elvi_forecasts.parquet'))

# Download the codebook
download.file(paste0('https://raw.githubusercontent.com/OEFDataScience/',
                     'REIGN.github.io/gh-pages/documents/ELVI_CODEBOOK.pdf'),
              here('doc', 'ELVI_CODEBOOK.pdf'),
              mode = 'wb')

rm(elvi_event, elvi_forecast)

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
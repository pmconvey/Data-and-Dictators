# Download the Correlates of War (CoW) list of states

library(here)
library(arrow)

states <- read.csv(paste0('https://correlatesofwar.org/wp-content/uploads/',
                          'COW-country-codes.csv'))
arrow::write_parquet(states, here('data', 'cow_states.parquet'))

rm(states)

sessionInfo()
# R version 4.3.0 (2023-04-21 ucrt)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 11 x64 (build 22621)
# 
# Matrix products: default
# 
# 
# locale:
# [1] LC_COLLATE=English_United States.utf8 
# [2] LC_CTYPE=English_United States.utf8   
# [3] LC_MONETARY=English_United States.utf8
# [4] LC_NUMERIC=C                          
# [5] LC_TIME=English_United States.utf8    
# 
# time zone: America/Chicago
# tzcode source: internal
# 
# attached base packages:
# [1] stats     graphics  grDevices utils     datasets  methods  
# [7] base     
# 
# other attached packages:
# [1] arrow_11.0.0.3 here_1.0.1    
# 
# loaded via a namespace (and not attached):
# [1] assertthat_0.2.1 R6_2.5.1         bit_4.0.5        tidyselect_1.2.0
# [5] tzdb_0.3.0       magrittr_2.0.3   glue_1.6.2       bit64_4.0.5     
# [9] lifecycle_1.0.3  cli_3.6.1        vctrs_0.6.2      compiler_4.3.0  
# [13] rprojroot_2.0.3  purrr_1.0.1      rstudioapi_0.14  tools_4.3.0     
# [17] rlang_1.1.0 
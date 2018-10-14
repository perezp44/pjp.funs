#library(tidyverse)
#
# devtools::install_github("perezp44/pjp.funs", force = TRUE)
# library(pjp.funs)


library(pjp.funs)
aa <- my_df_estadisticos_basicos(df_prueba)  #- primera f.
aa <- my_round_nice(df_prueba$X_numeric)  #- segunda f.
aa <- my_df_valores_unicos(df_prueba)  #- tercera f.

aa <- my_df_decimales(df_prueba, nn = 4)


help(pjp.funs)
vignette(package = "pjp.funs") #- no se xq no sale la vignette


x <- c(1,2)
y <- c(2:7)

aa <- my_not_in(x,y)

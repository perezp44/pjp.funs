library(tidyverse)

X_factor <- rep( factor(c("Blue", "Red", "Green", "Dark")), 5)
X_numeric <- rep(c(1.23, 2.75, 4.34, 7.89, 8.44), 4)
X_integer <- as.integer(rep(c(1:5),4))
X_logical <- rep(c(TRUE, TRUE, FALSE, TRUE), 5)
X_text <- rep(c("Hola", "tete", "carambano", "adios"), 5)
fechas <- rep(c("2018/01/01", "2015/03/09"), 10)
X_POSIXct <- as.POSIXct(fechas) #- xq este me daba pbs

df_prueba <- tibble(X_factor, X_numeric, X_integer, X_logical, X_POSIXct)
map(df_prueba, class) #- Ok class gives two for X_positx


library(usethis)
# use_data(df_prueba) #- lo guarde con esta linea que usa el pkg usethis
# luego lo has de documentar ...

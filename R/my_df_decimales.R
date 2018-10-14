#' @title redondead un df dejando los decimales q le digas
#' @description decimales_df_pjp() te retorna un df con los decimales que le digas (default = 2)
#' decimales_df_pjp function redondea los valores de un dataframe. Le metes un df y redondea sus valores
#'
#' @param df Un dataframe
#' @param nn el nº de decimales (Default = 2)
#' @return Un nuevo \code{df} con sus valores redondeados a \code{nn}
#' @examples
#' my_df_decimales(cars, nn = 2)
#' @export


my_df_decimales <- function(df, nn = 2) {
  is.num <- sapply(df, is.numeric)
  df[is.num] <- lapply(df[is.num], round, nn)
  df
}

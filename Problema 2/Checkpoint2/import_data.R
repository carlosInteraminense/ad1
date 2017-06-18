import_data <- function() {
  if (!exists("dados") || is.null(dados)) {
    dados <<- read.csv("series_from_imdb.csv")
  }
}
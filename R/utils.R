`%||%` <- function(x, y) {
  if(is.null(x)) y else x
}

split_rmd = function(file) {
  x = readLines(file, encoding = 'UTF-8')
  i = grep('^---\\s*$', x)
  n = length(x)
  if (length(i) < 2) {
    list(
      yaml = character(),
      body = x
    )
  } else {
    list(
      yaml = x[i[1]:i[2]],
      body = if (i[2] == n) {
        character()
      } else {
        x[(i[2]+1):n]
      }
    )
  }
}

# list_defaults <- function(x, ...) {
#   defaults <- list(...)
#   nm <- setdiff(names(defaults), names(x))
#   x[nm] <- defaults[nm]
#   x
# }

# remove whitespace and convert to upper case
.to_upper_remove_ws <- function(x) {
    x <- gsub("\\s", "", x, perl = TRUE)
    toupper(x)
}
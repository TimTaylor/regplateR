# remove whitespace and convert registrations to upper case
.toupperRemoveWhitespace <- function(x) {
    x <- gsub("\\s", "", x, perl = TRUE)
    toupper(x)
}

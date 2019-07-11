#' Remove whitespace and convert registrations to upper case
#'
#' @param x character string
#'
#' @keywords internal
case_and_space <- function(x) {

    # remove whitespace
    x <- gsub("\\s", "", x)

    # convert to upper case
    x <- toupper(x)
}

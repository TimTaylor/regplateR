#' Match registrations to a regex pattern
#'
#' Wrapper function around grep that returns the indices of the vector that
#' match the provided regular expression.  To help with matching whitespace and
#' case are ignored.
#'
#' @param x character vector of registrations
#' @param my_regex regex pattern you want to match
#' @param ... additional arguments that \code{grep} can use
#'
#' @return indices of x that match the given pattern
#' @keywords internal
reg_match <- function(x, my_regex, ...) {

  # remove whitespace
  x <- gsub("\\s", "", x)

  # convert to upper case
  x <- toupper(x)

  # pattern for registrations
  pattern <- my_regex

  # return indices of current registrations
  grep(pattern, x, ...)
}


#' Match current car registration plates (from 01 September 2001)
#'
#' Matches all character inputs of the form 2 letters, 2 numbers, 3 letters.
#'
#' @param x character vector of registrations
#'
#' @return indices of x that match current registration pattern
#' @export
current_reg <- function(x) {
  pattern <- "(^[A-Z]{2}[0-9]{2}[A-Z]{3}$)"
  reg_match(x, pattern, perl = TRUE)
}


#' Match car registration plates with a one letter prefix
#' (01 August 1983 to 31 August 2001)
#'
#' Matches all character inputs of the form 1 letter, 1 to 3 numbers, 3 letters.
#'
#' @param x character vector of registrations
#'
#' @return indices of x that match current registration pattern
#' @export
prefix_reg <- function(x) {
  pattern <- "(^[A-Z][0-9]{1,3}[A-Z]{3}$)"
  reg_match(x, pattern, perl = TRUE)
}


#' Match car registration plates with a one letter suffix
#' (February 1963 to 31 July 1983)
#'
#' Matches all character inputs of the form 3 letters, 1 to 3 numbers, 1 letter.
#'
#' @param x character vector of registrations
#'
#' @return indices of x that match current registration pattern
#' @export
suffix_reg <- function(x) {
  pattern <- "(^[A-Z]{3}[0-9]{1,3}[A-Z]$)"
  reg_match(x, pattern, perl = TRUE)
}

#' Match dateless car registration plates (pre 1963 - I believe)
#'
#' Matches all character inputs of the forms:
#'   - 1 to 4 numbers, 1 to 2 letters
#'   - 1 to 3 numbers, 1 to 3 letters
#'   - 1 to 2 letters, 1 to 4 numbers
#'   - 1 to 3 letters, 1 to 3 numbers
#'
#' @param x character vector of registrations
#'
#' @return indices of x that match current registration pattern
#' @export
dateless_reg <- function(x) {

  # regex
  dateless_1 <- "(^[0-9]{1,4}[A-Z]{1,2}$)"
  dateless_2 <- "(^[0-9]{1,3}[A-Z]{1,3}$)"
  dateless_3 <- "(^[A-Z]{1,2}[0-9]{1,4}$)"
  dateless_4 <- "(^[A-Z]{1,3}[0-9]{1,3}$)"

  # all dateless regex
  pattern <- paste(dateless_1,
                   dateless_2,
                   dateless_3,
                   dateless_4,
                   sep = "|")

  reg_match(x, pattern, perl = TRUE)
}


#' Match all valid car registration plates
#'
#' Matches plates of the following format and returns their positional index
#'   - dateable plates (1963 onwards)
#'     - 2 letters, 2 numbers, 3 letters
#'     - 1 letter, 1 to 3 numbers, 3 letters
#'     - 3 letters, 1 to 3 numbers, 1 letter
#'
#'   - dateless plates (pre 1963)
#'     - 1 to 4 numbers, 1 to 2 letters
#'     - 1 to 3 numbers, 1 to 3 letters
#'     - 1 to 2 letters, 1 to 4 numbers
#'     - 1 to 3 letters, 1 to 3 numbers
#'
#' @param x character vector of registrations
#'
#' @return indices of x that match a valid registration pattern
#' @export
valid_reg <- function(x) {

  # regex
  current <- "(^[A-Z]{2}[0-9]{2}\\s?[A-Z]{3}$)"
  prefix <- "(^[A-Z][0-9]{1,3}[A-Z]{3}$)"
  suffix <- "(^[A-Z]{3}[0-9]{1,3}[A-Z]$)"
  dateless_1 <- "(^[0-9]{1,4}[A-Z]{1,2}$)"
  dateless_2 <- "(^[0-9]{1,3}[A-Z]{1,3}$)"
  dateless_3 <- "(^[A-Z]{1,2}[0-9]{1,4}$)"
  dateless_4 <- "(^[A-Z]{1,3}[0-9]{1,3}$)"

  # all valid licences
  pattern <- paste(current,
                   prefix,
                   suffix,
                   dateless_1,
                   dateless_2,
                   dateless_3,
                   dateless_4,
                   sep = "|")

  reg_match(x, pattern, perl = TRUE)
}

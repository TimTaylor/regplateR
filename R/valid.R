#' Match car registration plates
#'
#' These functions validate GB registration plates of varying formats.
#'
#' * isCurrentReg matches current plates (from 01 September 2001) of the form 2
#'   letters, 2 numbers, 3 letters.
#' * isPrefixReg matches historic plates (01 August 1983 to 31 August 2001) with a
#'   1 letter prefix. These are of the form 1 letter, 1 to 3 numbers, 3 letters.
#' * isSuffixReg matches historic plates (February 1963 to 31 July 1983) with a
#'   1 letter suffix. These are of the form 3 letters, 1 to 3 numbers, 1 letter.
#' * isDatelessReg matches historic dateless plates (pre 1963 - I believe) of the
#'   following forms:
#'     - 1 to 4 numbers, 1 to 2 letters
#'     - 1 to 3 numbers, 1 to 3 letters
#'     - 1 to 2 letters, 1 to 4 numbers
#'     - 1 to 3 letters, 1 to 3 numbers
#' * isValidReg matches all of the above formats.
#'
#' @param x character vector of registrations.
#'
#' @return A logical vector (match or not for each element of x).
#' @name isValidReg
NULL

#' @rdname isValidReg
#' @export
isCurrentReg <- function(x) {
    x <- .toupperRemoveWhitespace(x)
    pattern <- "(^[A-Z]{2}[0-9]{2}[A-Z]{3}$)"
    grepl(pattern, x, perl = TRUE)
}

#' @rdname isValidReg
#' @export
isPrefixReg <- function(x) {
    x <- .toupperRemoveWhitespace(x)
    pattern <- "(^[A-Z][0-9]{1,3}[A-Z]{3}$)"
    grepl(pattern, x, perl = TRUE)
}

#' @rdname isValidReg
#' @export
isSuffixReg <- function(x) {
    x <- .toupperRemoveWhitespace(x)
    pattern <- "(^[A-Z]{3}[0-9]{1,3}[A-Z]$)"
    grepl(pattern, x, perl = TRUE)
}

#' @rdname isValidReg
#' @export
isDatelessReg <- function(x) {
    x <- .toupperRemoveWhitespace(x)

    dateless_1 <- "(^[0-9]{1,4}[A-Z]{1,2}$)"
    dateless_2 <- "(^[0-9]{1,3}[A-Z]{1,3}$)"
    dateless_3 <- "(^[A-Z]{1,2}[0-9]{1,4}$)"
    dateless_4 <- "(^[A-Z]{1,3}[0-9]{1,3}$)"

    pattern <- paste(dateless_1, dateless_2, dateless_3, dateless_4, sep = "|")

    grepl(pattern, x, perl = TRUE)
}

#' @rdname isValidReg
#' @export
isValidReg <- function(x) {

    x <- .toupperRemoveWhitespace(x)

    current <- "(^[A-Z]{2}[0-9]{2}\\s?[A-Z]{3}$)"
    prefix <- "(^[A-Z][0-9]{1,3}[A-Z]{3}$)"
    suffix <- "(^[A-Z]{3}[0-9]{1,3}[A-Z]$)"
    dateless_1 <- "(^[0-9]{1,4}[A-Z]{1,2}$)"
    dateless_2 <- "(^[0-9]{1,3}[A-Z]{1,3}$)"
    dateless_3 <- "(^[A-Z]{1,2}[0-9]{1,4}$)"
    dateless_4 <- "(^[A-Z]{1,3}[0-9]{1,3}$)"

    pattern <- paste(current, prefix, suffix, dateless_1, dateless_2,
                     dateless_3, dateless_4, sep = "|")

    grepl(pattern, x, perl = TRUE)
}

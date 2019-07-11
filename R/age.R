#' Registration date of current number plates
#'
#' @param x character vector of current-style registration plates
#'
#' @return the earliest possible registration date of the given reg plates
#' @keywords internal
current_reg_date <- function(x) {

    x <- case_and_space(x) # remove whitespace and ensure upper case

    period_1 <- "-03-01"
    period_2 <- "-09-01"
    id <- as.numeric(substr(x, 3, 4))
    my_date <- ifelse (id < 51,
                       paste0(2000 + id, period_1),
                       paste0(1950 + id, period_2))
    as.Date(my_date)
}


#' Registration date of prefix style number plates
#'
#' @param x character vector of prefix-style registration plates
#'
#' @return the earliest possible registration date of the given reg plates
#' @keywords internal
prefix_reg_date <- function(x) {
  
  x <- case_and_space(x) # remove whitespace and ensure upper case
  
  lookup <- c("A" = as.Date("1983-08-01"),
              "B" = as.Date("1984-08-01"),
              "C" = as.Date("1985-08-01"),
              "D" = as.Date("1986-08-01"),
              "E" = as.Date("1987-08-01"),
              "F" = as.Date("1988-08-01"),
              "G" = as.Date("1989-08-01"),
              "H" = as.Date("1990-08-01"),
              "J" = as.Date("1991-08-01"),
              "K" = as.Date("1992-08-01"),
              "L" = as.Date("1993-08-01"),
              "M" = as.Date("1994-08-01"),
              "N" = as.Date("1995-08-01"),
              "P" = as.Date("1996-08-01"),
              "R" = as.Date("1997-08-01"),
              "S" = as.Date("1998-08-01"),
              "T" = as.Date("1999-03-01"),
              "V" = as.Date("1999-09-01"),
              "W" = as.Date("2000-03-01"),
              "X" = as.Date("2000-09-01"),
              "Y" = as.Date("2001-03-01"))

  id <- substr(x, 1, 1) # date represented by first letter
  unname(lookup[id])
}


#' Registration date of suffix style number plates
#'
#' @param x character vector of suffix-style registration plates
#'
#' @return the earliest possible registration date of the given reg plates
#' @keywords internal
suffix_reg_date <- function(x) {
  
  x <- case_and_space(x) # remove whitespace and ensure upper case
  
  lookup <- c("A" = as.Date("1963-02-01"),
              "B" = as.Date("1964-01-01"),
              "C" = as.Date("1965-01-01"),
              "D" = as.Date("1966-01-01"),
              "E" = as.Date("1967-01-01"),
              "F" = as.Date("1967-08-01"),
              "G" = as.Date("1968-08-01"),
              "H" = as.Date("1969-08-01"),
              "J" = as.Date("1970-08-01"),
              "K" = as.Date("1971-08-01"),
              "L" = as.Date("1972-08-01"),
              "M" = as.Date("1973-08-01"),
              "N" = as.Date("1974-08-01"),
              "P" = as.Date("1975-08-01"),
              "R" = as.Date("1976-08-01"),
              "S" = as.Date("1977-08-01"),
              "T" = as.Date("1978-08-01"),
              "V" = as.Date("1979-08-01"),
              "W" = as.Date("1980-08-01"),
              "X" = as.Date("1981-08-01"),
              "Y" = as.Date("1982-08-01"))

  id <- substr(x, nchar(x), nchar(x)) # last character represents year
  unname(lookup[id])
}


#' Return registration date of number plate(s)
#'
#' @param x character vector of registrations
#'
#' @return The corresponding registration plate dates
#' @export
reg_date <- function(x) {
  dates <- rep(NA, length(x))
  dates <- as.Date(dates)

  idx <- current_reg(x)
  dates[idx] <- current_reg_date(x[idx])

  idx <- prefix_reg(x)
  dates[idx] <- prefix_reg_date(x[idx])

  idx <- suffix_reg(x)
  dates[idx] <- suffix_reg_date(x[idx])

  dates
}

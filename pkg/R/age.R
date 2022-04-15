#' Registration date of plates(s)
#'
#' @param x character vector of registrations
#'
#' @return The corresponding registration plate dates
#' @export
reg_date <- function(x) {
    x <- .to_upper_remove_ws(x)

    dates <- rep(NA_real_, length(x))
    dates <- as.Date(dates)

    idx <- is_current(x)
    dates[idx] <- .current_date(x[idx])

    idx <- is_prefix(x)
    dates[idx] <- .prefix_date(x[idx])

    idx <- is_suffix(x)
    dates[idx] <- .suffix_date(x[idx])

    dates
}


# the earliest possible registration date of current-style registration plates
.current_date <- function(x) {
    p1 <- "-03-01"
    p2 <- "-09-01"
    id <- as.numeric(substr(x, 3, 4))
    my_date <- ifelse(id < 51, paste0(2000 + id, p1), paste0(1950 + id, p2))
    as.Date(my_date)
}


# the earliest possible registration date of prefix style number plates
.prefix_date <- function(x) {
    lookup <- c(
        "A" = as.Date("1983-08-01"),
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
        "Y" = as.Date("2001-03-01")
    )

    id <- substr(x, 1, 1) # date represented by first letter
    unname(lookup[id])
}


# the earliest possible registration date of suffix style number plates
.suffix_date <- function(x) {
    lookup <- c(
        "A" = as.Date("1963-02-01"),
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
        "Y" = as.Date("1982-08-01")
    )

    id <- substr(x, nchar(x), nchar(x)) # last character represents year
    unname(lookup[id])
}
% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/valid.R
\name{is_valid}
\alias{is_valid}
\alias{is_current}
\alias{is_prefix}
\alias{is_suffix}
\alias{is_dateless}
\title{Registration plate predicates}
\usage{
is_current(x)

is_prefix(x)

is_suffix(x)

is_dateless(x)

is_valid(x)
}
\arguments{
\item{x}{character vector of registrations.}
}
\value{
A logical vector (match or not for each element of x).
}
\description{
These functions validate GB registration plates of varying formats.

* is_current matches current plates (from 01 September 2001) of the form 2
  letters, 2 numbers, 3 letters.

* is_prefix matches historic plates (01 August 1983 to 31 August 2001) with a
  1 letter prefix. These are of the form 1 letter, 1 to 3 numbers, 3 letters.

* is_suffix matches historic plates (February 1963 to 31 July 1983) with a
  1 letter suffix. These are of the form 3 letters, 1 to 3 numbers, 1 letter.

* is_dateless matches historic dateless plates (pre 1963 - I believe) of the
  following forms:
    - 1 to 4 numbers, 1 to 2 letters
    - 1 to 3 numbers, 1 to 3 letters
    - 1 to 2 letters, 1 to 4 numbers
    - 1 to 3 letters, 1 to 3 numbers

* is_valid matches all of the above formats.
}

<!-- README.md is generated from README.Rmd. Please edit that file -->

# {regplateR}

{regplateR} validates and dates GB vehicles registration plates. This
[gist](https://gist.github.com/danielrbradley/7567269) by Daniel Bradley
helped with the regular expressions and further information was obtained
from
[wikipedia](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom).

## Installation

This package is not on CRAN but can be installed via:

``` r
install.packages("regplateR", repos = "https://timtaylor.r-universe.dev")
```

## Available functions

<table>
<thead>
<tr class="header">
<th>Function</th>
<th>returns</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>is_current(x)</code></td>
<td>index of plates in <code>x</code> in the current format</td>
</tr>
<tr class="even">
<td><code>is_prefix(x)</code></td>
<td>index of plates in <code>x</code> in the prefix format</td>
</tr>
<tr class="odd">
<td><code>is_suffix(x)</code></td>
<td>index of plates in <code>x</code> in the suffix format</td>
</tr>
<tr class="even">
<td><code>is_dateless(x)</code></td>
<td>index of plates in <code>x</code> in the dateless format</td>
</tr>
<tr class="odd">
<td><code>is_valid(x)</code></td>
<td>index of plates in <code>x</code> in the 1 of above formats</td>
</tr>
<tr class="even">
<td><code>reg_date(x)</code></td>
<td>earliest possible registration dates of plates in <code>x</code></td>
</tr>
</tbody>
</table>

## Example

``` r
library(regplateR)

# example plates
plates <- c(
  "BD63 SMR", "BD15 SMR", "BD50 SMR", # current
  "test", "test", # invalid
  "P888 PPE", # prefix
  "FVL 144M", # suffix
  "112 DFH", "MLP 6" # dateless
)

# valid registrations
(valid_plates <- plates[is_valid(plates)])
#> [1] "BD63 SMR" "BD15 SMR" "BD50 SMR" "P888 PPE" "FVL 144M" "112 DFH"  "MLP 6"

# earliest registration of plates
reg_date(valid_plates)
#> [1] "2013-09-01" "2015-03-01" "2050-03-01" "1996-08-01" "1973-08-01"
#> [6] NA           NA
```

## Validation overview

For the moment `regplateR` is quite broad in what is accepted as a valid
plate, with four different formats currently accepted and no additional
rules applied.

### [Current GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#Current_system)

Current car registration plates (from 01 September 2001) must be of the
form:

-   2 letters, 2 numbers, 3 letters (e.g. BD51 SMR)

### [Prefix GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#1983_to_2001)

Between 01 August 1983 and 31 August 2001 registration plates had a one
letter prefix and were of the form:

-   1 letter, 1 to 3 numbers, 3 letters (e.g. P888 PPE)

### [Suffix GB format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#1963_to_1982)

Between February 1963 to 31 July 1983 registration plates had a one
letter suffix and were of the form:

-   3 letters, 1 to 3 numbers, 1 letter (e.g. FVL 144M)

### [Dateless format](https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_the_United_Kingdom#History)

Pre 1963 (I think) registration plates had one of the following forms:

-   1 to 4 numbers, 1 to 2 letters
-   1 to 3 numbers, 1 to 3 letters (e.g. 112 DFH)
-   1 to 2 letters, 1 to 4 numbers
-   1 to 3 letters, 1 to 3 numbers (e.g. MLP 6)

Confusingly these can also overlap with Northern Ireland (NI) plates
that take a similar form. At present the package makes no attempts to
identify NI plates.

## Improvements needed

There are many additional validations that still need to be incorporated
in the package (e.g. “I” and “Q” cannot be used in the three-letter
sequence of current registration plates).

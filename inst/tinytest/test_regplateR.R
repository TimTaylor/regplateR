# current_reg
plates <- c("BD51 SMR", "Zippy", "Bungle55", "BD51 SMR")
target <- c(TRUE, FALSE, FALSE, TRUE)
expect_identical(is_current(plates), target)

# prefix
plates <- c("P888 PPE", "BD51 SMR", "Bungle55", "P888 PPE")
target <- c(TRUE, FALSE, FALSE, TRUE)
expect_identical(is_prefix(plates), target)

# suffix
plates <- c("P888 PPE", "BD51 SMR", "FVL 144M", "P888 PPE")
target <- c(FALSE, FALSE, TRUE, FALSE)
expect_identical(is_suffix(plates), target)

# dateless
plates <- c("P888 PPE", "BD51 SMR", "FVL 144M", "P888 PPE", "112 DFH", "MLP 6")
target <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)
expect_identical(is_dateless(plates), target)

# valid
plates <- c("BD63 SMR", "BD15 SMR", "BD50 SMR", "test", "test",
            "P888 PPE", "FVL 144M", "112 DFH", "MLP 6")
target <- logical(9L)
target[c(1L, 2L, 3L, 6L, 7L, 8L, 9L)] <- TRUE
expect_identical(is_valid(plates), target)

# date
plates <- c(
    "BD63 SMR", "BD15 SMR", "BD50 SMR",
    "P888 PPE",
    "FVL 144M",
    "112 DFH", "MLP 6"
)
target <- as.Date(c(
    "2013-09-01", "2015-03-01", "2050-03-01",
    "1996-08-01",
    "1973-08-01",
    NA, NA)
)
expect_identical(reg_date(plates), target)

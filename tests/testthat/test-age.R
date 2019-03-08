context("test-age")

test_that("Current registration plates are dated correctly", {

  # test case
  test_case <- c("BD63 SMR", "BD15 SMR", "BD50 SMR")

  # dates
  dates <- current_reg_date(test_case)

  # expected result
  expected <- as.Date(c("2013-09-01", "2015-03-01", "2050-03-01"))

  # test
  expect_equal(dates, expected)
})



test_that("Prefix registration plates are dated correctly", {

  # test case
  test_case <- "P888 PPE"

  # date
  dates <- prefix_reg_date(test_case)

  # expected result
  expected <- as.Date("1996-08-01")

  # test
  expect_equal(dates, expected)
})


test_that("Suffix registration plates are dated correctly", {

  # test case
  test_case <- "FVL 144M"

  # date
  dates <- suffix_reg_date(test_case)

  # expected result
  expected <- as.Date("1973-08-01")

  # test
  expect_equal(dates, expected)
})



test_that("reg_date correctly dates plates", {

  # test case
  test_case <- c("BD63 SMR", "BD15 SMR", "BD50 SMR",
                 "P888 PPE",
                 "FVL 144M",
                 "112 DFH", "MLP 6")

  # date
  dates <- reg_date(test_case)

  # expected result
  expected <- as.Date(c("2013-09-01", "2015-03-01", "2050-03-01",
                        "1996-08-01",
                        "1973-08-01",
                        NA, NA))

  # test
  expect_equal(dates, expected)
})

context("test-validation")


test_that("reg_match works ignoring case and whitespace", {

  # test case
  test_case <- c("Bob",
                 "t   E  s      t",
                 "George",
                 "TE         st")

  # pattern to match
  pattern <- "TEST"

  # indices matching pattern
  matches <- reg_match(test_case, pattern, perl = TRUE)

  # expected result
  expected <- c(2, 4)

  # test
  expect_equal(matches, expected)
})


test_that("current_reg correctly identifies current registration plates", {

  # test case
  test_case <- c("BD51 SMR", "Zippy", "Bungle55", "BD51 SMR")

  # indices matching pattern
  matches <- current_reg(test_case)

  # expected result
  expected <- c(1, 4)

  # test
  expect_equal(matches, expected)
})



test_that("prefix_reg correctly identifies prefix registration plates", {

  # test case
  test_case <- c("P888 PPE", "BD51 SMR", "Bungle55", "P888 PPE")

  # indices matching pattern
  matches <- prefix_reg(test_case)

  # expected result
  expected <- c(1, 4)

  # test
  expect_equal(matches, expected)
})



test_that("suffix_reg correctly identifies suffix registration plates", {

  # test case
  test_case <- c("P888 PPE", "BD51 SMR", "FVL 144M", "P888 PPE")

  # indices matching pattern
  matches <- suffix_reg(test_case)

  # expected result
  expected <- 3

  # test
  expect_equal(matches, expected)
})


test_that("dateless_reg correctly identifies dateless registration plates", {

  # test case
  test_case <- c("P888 PPE", "BD51 SMR", "FVL 144M",
                 "P888 PPE", "112 DFH", "MLP 6")

  # indices matching pattern
  matches <- dateless_reg(test_case)

  # expected result
  expected <- c(5, 6)

  # test
  expect_equal(matches, expected)
})



test_that("valid_reg correctly validates plates", {

  # test case
  test_case <- c("BD63 SMR", "BD15 SMR", "BD50 SMR",
                 "test", "test",
                 "P888 PPE", "FVL 144M", "112 DFH", "MLP 6")

  # indices matching pattern
  matches <- valid_reg(test_case)

  # expected result
  expected <- c(1, 2, 3, 6, 7, 8, 9)

  # test
  expect_equal(matches, expected)
})

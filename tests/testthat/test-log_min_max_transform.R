test_that("Correct values from log-min-max transformation:", {
  expect_equal(
    log_min_max_transform(c(1, 10, 100, 1000)),
    c(0, 1/3, 2/3, 1)
  )

  expect_equal(
    log_min_max_transform(c(1, 10, 100), base = 10),
    c(0, 1/2, 1)
  )
})


test_that("Handling missing values:", {
  expect_equal(
    log_min_max_transform(c(1, 10, 100, NA), replaceNA = FALSE),
    c(0, 0.5, 1, NA)
  )

  expect_equal(
    log_min_max_transform(c(1, 10, 100, NA), replaceNA = TRUE),
    c(0, 0.5, 1, log(37) / log(100))
  )
})


test_that("Handling errors:", {
  expect_error(
    log_min_max_transform(c("1", "2", "3")),
    "Requires a numeric input vector"
  )

  expect_error(
    log_min_max_transform(c(1, NA, NA)),
    "Minimum number of non-missing values is 2"
  )

  expect_error(
    log_min_max_transform(c(2, 2, 2)),
    "The denominator cannot be zero"
  )

  expect_error(
    log_min_max_transform(c(1, 10, Inf)),
    "The input should be finite"
  )

  expect_error(
    log_min_max_transform(c(-10, 1, 10)),
    "Logarithm of non-positive inputs is not defined"
  )

  expect_error(
    log_min_max_transform(c(0, 10, 100)),
    "Logarithm of non-positive inputs is not defined"
  )

  expect_error(
    log_min_max_transform(c(1, 10, 100), replaceNA = "TRUE"),
    "replaceNA should be Boolean"
  )

  expect_error(
    log_min_max_transform(c(1, 10, 100), base = "10"),
    "Base should be numeric scalar"
  )

  expect_error(
    log_min_max_transform(c(1, 10, 100), base = 1),
    "Base should be finite-positive"
  )

  expect_error(
    log_min_max_transform(c(1, 10, 100), base = -10),
    "Base should be finite-positive"
  )

  expect_error(
    log_min_max_transform(c(1, 10, 100), base = Inf),
    "Base should be finite-positive"
  )
})


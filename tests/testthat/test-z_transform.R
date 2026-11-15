test_that("Correct values from z-transformation:", {

  expect_equal(
    z_transform(c(5, 10, 15)),
    c(-1, 0, 1)
  )

})

test_that("Handling missing values:", {

  expect_equal(
    z_transform(c(-15, 0, 15, NA), replaceNA = FALSE),
    c(-1, 0, 1, NA)
  )

  expect_equal(
    z_transform(c(-5, 0, 5, NA), replaceNA = TRUE),
    c(-sqrt(3/2), 0, sqrt(3/2), 0)
  )

})

test_that("Handling errors:", {

  expect_error(
    z_transform(c(2, 1, "2", "3", NA)),
    "Requires a numeric input vector"
  )

  expect_error(
    z_transform(c(2, NA, NA, NA)),
    "Minimum number of non-missing values is 2"
  )

  expect_error(
    z_transform(c(2, 2, 2)),
    "Standard deviation cannot be zero"
  )

  expect_error(
    z_transform(c(2, 22, Inf)),
    "The input should be finite"
  )

  expect_error(
    z_transform(c(2, 12, NA), replaceNA = "TRUE"),
    "replaceNA should be Boolean"
  )

})



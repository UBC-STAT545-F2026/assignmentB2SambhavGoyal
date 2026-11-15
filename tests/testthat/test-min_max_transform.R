test_that("Correct values from min-max transformation:", {
  expect_equal(
    min_max_transform(c(-1, 0, 1)),
    c(0, 0.5, 1)
  )

  expect_equal(
    min_max_transform(0:5),
    (0:5)/5
  )

  expect_equal(
    min_max_transform(c(10, 50, NA, 190)),
    c(0, 2/9, NA, 1)
  )
})

test_that("Handling missing values:", {
  expect_equal(
    min_max_transform(c(-10, 0, 10, NA), replaceNA = FALSE),
    c(0, 0.5, 1, NA)
  )

  expect_equal(
    min_max_transform(c(-10, 0, 10, NA), replaceNA = TRUE),
    c(0, 0.5, 1, 0.5)
  )
})

test_that("Error handling:", {
  expect_error(
    min_max_transform(c(2, 1, "2", "3", NA)),
    "Requires a numeric input vector"
    )

  expect_error(
    min_max_transform(c(2, NA, NA, NA)),
    "Minimum number of non-missing values is 2"
    )

  expect_error(
    min_max_transform(c(2, 2, 2)),
    "The denominator cannot be zero"
    )

  expect_error(
    min_max_transform(c(2, 22, Inf)),
    "The input should be finite"
    )

  expect_error(
    min_max_transform(c(2, 12, NA), replaceNA = "TRUE"),
    "replaceNA should be Boolean"
    )
  })

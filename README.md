
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2SambhavGoyal

<!-- badges: start -->

<!-- badges: end -->

The goal of assignmentB2SambhavGoyal is to provide functions for
transforming and scaling numeric vectors using various mathematical
approaches.

## Installation

You can install the development version of assignmentB2SambhavGoyal from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("UBC-STAT545-F2026/assignmentB2SambhavGoyal")
```

## Example

This is a basic example which shows you how to solve a common problem:
(…Think of something creative…)

``` r
library(assignmentB2SambhavGoyal)
## basic example code

product_prices <- c(2, 2.15, NA, 2.76, 1.99)

# Lets find prices after the scaling
assignmentB2SambhavGoyal::min_max_transform(product_prices, replaceNA = TRUE)
#> [1] 0.01298701 0.20779221 0.30519481 1.00000000 0.00000000
```

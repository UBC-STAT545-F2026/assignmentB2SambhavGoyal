
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assignmentB2SambhavGoyal

<!-- badges: start -->

<!-- badges: end -->

The goal of `assignmentB2SambhavGoyal` is to provide functions for
transforming and scaling numeric vectors using various mathematical
approaches. This is particularly useful for anyone handling data from
different sources and wants to scale it to a common form for comparison.

The three different functions developed in this package are:

- `min_max_transform` : Transforms the variable based on min-max scaling
  logic. This tells how deviated the values are from the minimum and
  divides by the range of the dataset. This transformation is given by:

$$
x_{scaled} = \frac{(x_{act} - min(X))}{(max(X) - min(X))} 
$$

for every $x_{act} \in X$, where $x_{act}$ is the actual value and $X$
is the numeric vector.

- `z_transform` : Transforms the variable based on z scores. This tells
  how deviated the values are from the mean value of the data and also
  considers spread of the distribution. This allows comparison of
  different variables. This transformation is given by:

$$
x_{scaled} = \frac{(x_{act} - \mu(X))}{\sigma(X)} 
$$

for every $x_{act} \in X$, where $x_{act}$ is the actual value, $X$ is
the numeric vector, $\mu(X)$ is the mean of the vector, and $\sigma(X)$
is the standard deviation of the vector.

- `log_min_max_transform` : Transforms the variable based on a
  combination of log scaling and min-max transformation. It introduces a
  nonlinear transformation that reduces differences among largely spread
  observations. This transformation is given by:

$$ 
x_{scaled} = \frac{(log(x_{act}) - log(min(X))}{(log(max(X)) - log(min(X))} 
$$

for every $x_{act} \in X$, where $x_{act}$ is the actual value, and $X$
is the numeric vector.

## Installation

You can install the development version of assignmentB2SambhavGoyal from
[GitHub](https://github.com/) with:

``` r
library(devtools)
devtools::install_github("UBC-STAT545-F2026/assignmentB2SambhavGoyal")
```

## Examples

Suppose we have product prices (measured in dollars), we can try to
apply three transformations:

``` r
library(assignmentB2SambhavGoyal)

product_prices <- c(2, 2.15, NA, 2.76, 1.99)

assignmentB2SambhavGoyal::min_max_transform(product_prices, replaceNA = TRUE)
#> [1] 0.01298701 0.20779221 0.30519481 1.00000000 0.00000000
assignmentB2SambhavGoyal::z_transform(product_prices, replaceNA = FALSE)
#> [1] -0.6179671 -0.2059890         NA  1.4693884 -0.6454323
assignmentB2SambhavGoyal::log_min_max_transform(product_prices)
#> [1] 0.01532437 0.23642354         NA 1.00000000 0.00000000
```

Here is another example of using the transformations using the
`penguins` dataset.

``` r
# Use the penguins dataset for the example
penguins<- palmerpenguins::penguins

penguins_transformed <- penguins |>
  dplyr::mutate(
    Original_flipper_length = flipper_length_mm,
    Min_Max = assignmentB2SambhavGoyal::min_max_transform(flipper_length_mm),
    Z_Score = assignmentB2SambhavGoyal::z_transform(flipper_length_mm),
    Log_Min_Max = assignmentB2SambhavGoyal::log_min_max_transform(flipper_length_mm)
  ) |>
  dplyr::select(Original_flipper_length, Min_Max, Z_Score, Log_Min_Max)

head(penguins_transformed)
#> # A tibble: 6 × 4
#>   Original_flipper_length Min_Max Z_Score Log_Min_Max
#>                     <int>   <dbl>   <dbl>       <dbl>
#> 1                     181   0.153  -1.42        0.173
#> 2                     186   0.237  -1.06        0.265
#> 3                     195   0.390  -0.421       0.426
#> 4                      NA  NA      NA          NA    
#> 5                     193   0.356  -0.563       0.391
#> 6                     190   0.305  -0.776       0.337
```

The table above shows the original flipper length and the transformed
values based on the three different functions used in the package.

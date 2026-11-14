
#' @title Logarithmic min-max scaling
#'
#' @description
#' Transform an input vector using a logarithmic scaling logic i.e. min-max scaling with logarithm of values.
#'
#' @param input A positive numeric vector input (requires length > 1); log of negative numbers is not defined
#' @param base A finite positive numeric scalar value specifying the base of the log; Default value is e which represents the the natural logarithm (ln).
#' @param replaceNA A boolean user input to handle missing values by replacement with mean of non-missing values; Default is FALSE, implying the missing values will be kept and not changed to mean
#'
#' @return A numeric vector containing log-minmax transformed values.
#'
#' @examples
#' log_min_max_transform(c(1, 2, 3))
#' log_min_max_transform(c(1, 10, 100), base = 10)
#' log_min_max_transform(c(1, NA, 10), replaceNA = TRUE)
#'
#' @export
log_min_max_transform <- function(input,
                                  base = exp(1),
                                  replaceNA = FALSE) {

  stopifnot("Requires a numeric input vector" =
              is.numeric(input))

  stopifnot("The input should be finite" =
              all(is.finite(input[!is.na(input)])))

  stopifnot("Logarithm of non-positive inputs is not defined" =
              all(input[!is.na(input)] > 0))

  stopifnot("replaceNA should be Boolean" =
              (is.logical(replaceNA) &&
                 length(replaceNA) == 1))

  stopifnot("Minimum number of non-missing values is 2" =
              sum(!is.na(input)) >= 2)

  stopifnot("Base should be numeric scalar" =
              (is.numeric(base) &&
                 length(base) == 1))

  stopifnot("Base should be finite-positive (but not equal to 1)" =
              (base != 1 &&
                 base > 0 &&
                 is.finite(base)))

  if(min(input, na.rm = TRUE) == max(input, na.rm = TRUE)){
    stop("Invalid Transformation: The denominator cannot be zero.")
  }

  if(replaceNA){
    input[is.na(input)] <- mean(input, na.rm = TRUE)
  }

  log_input <- log(input, base = base)
  log_min <- log(min(input, na.rm = TRUE), base = base)
  log_max <- log(max(input, na.rm = TRUE), base = base)


  log_scaled_out <- (log_input - log_min)/(log_max - log_min)

  return(log_scaled_out)
}

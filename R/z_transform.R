#' @title Z Score Transformation
#'
#' @description
#' Transform an input vector using a normal distribution scaling logic.
#'
#' @param input A numeric vector input (requires length > 1)
#' @param replaceNA A boolean user input to handle missing values by replacement with mean of non-missing values; Default is FALSE, implying the missing values will be kept and not changed to mean
#'
#' @returns A numeric vector containing the normally standardized values.
#'
#' @examples
#' z_transform(c(5, 10, 15))
#' z_transform(c(5, NA, 15, 20), replaceNA = TRUE)
#'
#' @export
z_transform <- function(input,
                        replaceNA = FALSE){

  # Check for inputs
  stopifnot("Requires a numeric input vector" =
              is.numeric(input))

  stopifnot("The input should be finite" =
              all(is.finite(input[!is.na(input)])))

  stopifnot("replaceNA should be Boolean" =
              (is.logical(replaceNA) &&
                 length(replaceNA) == 1))

  stopifnot("Minimum number of non-missing values is 2" =
              sum(!is.na(input)) >= 2)

  # Check for SD to be zero (Also considers equality of all numbers)
  if (stats::sd(input, na.rm = TRUE) == 0) {
    stop("Standard deviation cannot be zero")
  }

  # Handling replacement
  if(replaceNA){
    input[is.na(input)] <- mean(input, na.rm = TRUE)
  }

  z_scaled_out <- (input - mean(input, na.rm = TRUE))/(stats::sd(input, na.rm = TRUE))

  return(z_scaled_out)
}

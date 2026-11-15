#' @title Min Max Transformation
#'
#' @description
#' Transform an input vector using a min-max scaling logic
#'
#' @param input A numeric vector input (requires length > 1)
#' @param replaceNA A boolean user input to handle missing values by replacement with mean of non-missing values; Default is FALSE, implying the missing values will be kept and not changed to mean
#'
#' @returns A transformed vector (in the range 0 to 1); 0 is assigned to minimum of input vector and 1 to the maximum of the input vector
#'
#' @examples
#' min_max_transform(c(5, 10, 15))
#' min_max_transform(c(5, NA, 15, 20), replaceNA = TRUE)
#'
#' @export
min_max_transform <- function(input,
                              replaceNA = FALSE){

  stopifnot("Requires a numeric input vector" =
              is.numeric(input))

  stopifnot("The input should be finite" =
              all(is.finite(input[!is.na(input)])))

  stopifnot("replaceNA should be Boolean" =
              (is.logical(replaceNA) &&
                 length(replaceNA) == 1))

  stopifnot("Minimum number of non-missing values is 2" =
              sum(!is.na(input)) >= 2)

  if(min(input, na.rm = TRUE) == max(input, na.rm = TRUE)){
    stop("The denominator cannot be zero.")
  }

  if(replaceNA){
    input[is.na(input)] <- mean(input, na.rm = TRUE)
  }


  minmax_scaled_out <- (input - min(input, na.rm = TRUE))/(max(input, na.rm = TRUE) - min(input, na.rm = TRUE))

  return(minmax_scaled_out)
}

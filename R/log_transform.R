
#' @title Logarithmic Transformation
#'
#' @description
#' Transform an input vector using a logarithmic scaling logic.
#'
#' @param input A positive numeric vector input (requires length > 1); log of negative numbers is not defined
#' @param base A positive numeric value specifying the base of the log; Default value is e which represents the the natural logarithm (ln).
#' @param replaceNA A boolean user input to handle missing values by replacement with mean of non-missing values; Default is FALSE, implying the missing values will be kept and not changed to mean
#'
#' @return A numeric vector containing log-transformed values.
#'
#' @examples
#' log_transform(c(1, 2, 3))
#' log_transform(c(1, 10, 100), base = 10)
#' log_transform(c(1, NA, 10), replaceNA = TRUE)
#'
#' @export
log_transform <- function(input, base = exp(1),
                          replaceNA = FALSE) {



}

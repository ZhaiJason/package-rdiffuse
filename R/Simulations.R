#' S4 Class of Stochastic Process Simulations
#'
#' @slot process character. The type of process the object represented.
#' @slot paths numeric. A matrix containing the paths of the simulated stochastic process. Each row represent a step in time, and each column represents an individual path.
#' @slot params
#' @slot method character.
#'
#' @return An S4 Class object containing the information of new simulations.
#' @importFrom methods setClass
#' @importFrom stats rnorm
#' @export
#'
#' @examples
#' # PLACEHOLDER
setClass(
    Class = "Simulations",
    slots = list(
        process = "character",
        paths = "matrix",
        method = "character",
        params = "list"
    )
)

#' Plot Method for Simulations
#'
#' @param x Simulations. An object of class `"Simulations"`.
#' @param y missing. Not used.
#'
#' @return A plot of the simulated paths.
#' @import methods
#' @importFrom graphics matplot
#' @export
#'
#' @examples
#' sim <- gbm(mu = 0.1, sigma = 0.2, x0 = 100, t = 1)
#' plot(sim)
setMethod(
    "plot",
    signature(x = "Simulations", y = "missing"),
    function(x, y, ...) {
        matplot(
            x@paths,
            type = "l",
            xlab = "Time",
            ylab = "Value",
            main = paste("Simulated Paths of", x@process),
            ...
        )
    }
)

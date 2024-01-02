#' S4 Class of Stochastic Process Simulations
#'
#' @slot process character. The type of process the object represented.
#' @slot paths numeric. A matrix containing the paths of the simulated stochastic process. Each row represent a step in time, and each column represents an individual path.
#' @slot method character.
#' @slot npaths numeric.
#' @slot nsims numeric.
#'
#' @return
#' @export
#'
#' @examples
setClass(
    Class = "Simulations",
    slots = list(
        process = "character",
        paths = "numeric",
        method = "character",
        npaths = "numeric",
        nsims = "numeric"

        # Not implemented
        # analytical and computed: mean, variance, skewness, kurtosis
        # create_time = "numeric" # Time cost when creating
    )
)

setMethod(
    "plot", "Simulations",
    function() {
        NULL
    }
)

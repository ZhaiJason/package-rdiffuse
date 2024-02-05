#' Simulation for Geometric Brownian Motion
#'
#' @param mu numeric. The drift parameter.
#' @param sigma numeric. The diffusion parameter.
#' @param x0 numeric. The initial value.
#' @param t numeric. The time to simulate the process. Default `1`.
#' @param n_sims integer. The number of simulations. Default `100`.
#' @param n_steps integer. The number of steps to simulate the process. Default `100`.
#' @param method character. The method used to simulate the process. Default `exact`. Options include `"exact"`, `"euler"`, and `"milstein"`.
#'
#' @return An S4 Class object `"Simulations"` containing the information of new simulations.
#' @importFrom methods new
#' @importFrom stats rnorm
#' @export
#'
#' @examples
#' gbm(mu = 0.1, sigma = 0.2, x0 = 100, t = 1)
#' gbm(mu = 0.1, sigma = 0.2, x0 = 100, t = 1, n_sims = 1000, n_steps = 1000)
#' gbm(mu = 0.1, sigma = 0.2, x0 = 100, t = 1, method = "euler")
gbm <- function(mu, sigma, x0, t,
                n_sims = 100,
                n_steps = 100,
                method = "exact") {

    # Resolution
    dt <- t / n_steps

    # Simulation
    switch (method,
        "exact" = {
            # Simulation
            Z <- matrix(rnorm(n_sims * n_steps), nrow = n_steps, ncol = n_sims)
            X <- exp((mu - 0.5 * sigma^2) * dt + sigma * sqrt(dt) * Z)
            X <- apply(X, 1, cumprod)
            X <- rbind(matrix(1, ncol = n_sims), X)
            X <- x0 * X
        },
        "euler" = {
            # Simulation
            Z <- matrix(rnorm(n_sims * n_steps), nrow = n_steps, ncol = n_sims)
            X <- matrix(NA, nrow = n_steps + 1, ncol = n_sims)
            X[1, ] <- x0
            for (i in 1:n_steps) {
                X[i + 1, ] <- X[i, ] + mu * X[i, ] * dt + sigma * X[i, ] * sqrt(dt) * Z[i, ]
            }
        },
        "milstein" = {
            # Simulation
            Z <- matrix(rnorm(n_sims * n_steps), nrow = n_steps, ncol = n_sims)
            X <- matrix(NA, nrow = n_steps + 1, ncol = n_sims)
            X[1, ] <- x0
            for (i in 1:n_steps) {
                X[i + 1, ] <- X[i, ] + mu * X[i, ] * dt + sigma * X[i, ] * sqrt(dt) * Z[i, ] + 0.5 * sigma^2 * X[i, ] * (Z[i, ]^2 - 1) * dt
            }
        }
    )

    # Create object
    return(
        new(
            "Simulations",
            process = "Geometric Brownian Motion",
            paths = X,
            method = method,
            params = list(mu = mu, sigma = sigma, x0 = x0, t = t, n_sims = n_sims, n_steps = n_steps)
        )
    )

}

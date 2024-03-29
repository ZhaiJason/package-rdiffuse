% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Simulations.R
\name{plot,Simulations,missing-method}
\alias{plot,Simulations,missing-method}
\title{Plot Method for Simulations}
\usage{
\S4method{plot}{Simulations,missing}(x, y, ...)
}
\arguments{
\item{x}{Simulations. An object of class \code{"Simulations"}.}

\item{y}{missing. Not used.}
}
\value{
A plot of the simulated paths.
}
\description{
Plot Method for Simulations
}
\examples{
sim <- gbm(mu = 0.1, sigma = 0.2, x0 = 100, t = 1)
plot(sim)
}

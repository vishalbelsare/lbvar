% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/irf.R
\name{irf}
\alias{irf}
\title{VAR ipulse response functions}
\usage{
irf(object, ident, h, M = 100, unity.shock = TRUE)
}
\arguments{
\item{object}{A lbvar object.}

\item{ident}{A list with two elements: $A must be a matrix with the contemporaneus coefficients of a identified VAR and $sigma2u must be the structural shocks covariance matrix. This is the output of the function chol.identification.}

\item{h}{Number of steps ahead.}

\item{M}{Number of draws.}

\item{unity.shock}{If TRUE the impulses are equal 1. If FALSE the impulses are of one standard deviation (default=TRUE).}
}
\value{
An object with S3 class "irf".
\item{point.irf}{A list with the point ir coefficients. Each element in the list is a matrix with the response on all variables cause by an impulse on the variable that gives name to the matrix.}
\item{density}{A list that stores the ir coefficients from each draw. Each element in the list is another list with the response on all variables cause by an impulse on the variable that gives name to the list.}
}
\description{
Estimates impulse response coefficients of a lbvar model h steps ahead drawing from the posterior.
}
\examples{
## == This example uses the Brazilian inflation data from
#Garcia, Medeiros and Vasconcelos (2017) == ##

# = This is an ilustrative example = #
# = The identification ignores which variables are more exogenous = #
data("BRinf")
Y=BRinf[,1:59]# remove expectation variables
modelB=lbvar(Y,p=3)
identB=identification(modelB)
irfB=irf(modelB,identB,h=12,M=100)
plot(irfB,1,2,alpha=0.1)


}
\references{
Garcia, Medeiros and Vasconcelos (2017).
}
\seealso{
\code{\link{predict}}, \code{\link{lbvar}}, \code{\link{identification}}, \code{\link{plot.irf}}
}
\keyword{Bayesian}
\keyword{High-dimension,}
\keyword{VAR,}
\keyword{irf,}
\keyword{models}

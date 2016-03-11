# Utilities for reading BEAST2 logfiles and getting HPDs
#requireNamespace(boa)

#' Wrapper for timing a function
#' (probably not accurate)
timer <- function(fun, ...) {
  t <- Sys.time()
  x <- fun(...)
  print(Sys.time()-t)
  return(x)
}


#' Get HPD of a posterior sample
#' Uses Chen and Shao algorithm as implemented in boa package
#' 
#' @param data The samples from the posterior
#' @param alpha The confidence level
#' @return c(lower, median, upper)
#' 
#' @export
getHPD <- function(data, alpha=0.05) {
  hpd <- boa::boa.hpd(data, alpha)
  med <- median(data)
  return(c(hpd[1], med, hpd[2]))
}


#' Get HPD of a matrix of values e.g. after gridding a skyline
#' Assumes by default that each row represents a posterior sample and each column an interval
#' 
#' @export
getMatrixHPD <- function(datamat, margin=2, alpha=0.05) {
  return(apply(datamat, margin, getHPD, alpha))
}


#' Extract all the skyline parameters from the logfile
#' e.g. if par="R0" extract (R0s.1 R0s.2 R0s.3 etc.)
#' 
#' @export
getSkylineSubset <- function(logfile, par) {
  return(lf[grepl(par, names(lf))])
}


#' Read in BEAST2 logfile
#' maxsamples is only there for testing (load quicker)
#' 
#' @export
readLogfile <- function(filename, burnin=0.1, maxsamples=-1) {
  logfile <- read.table(filename, sep="\t", header=TRUE, nrows=maxsamples)
  n <- nrow(logfile)
  return(logfile[floor(burnin*n):n,])
}
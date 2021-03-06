% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Logfile_Utilities.R
\name{readLogfile}
\alias{readLogfile}
\title{Read in BEAST2 logfile}
\usage{
readLogfile(filename, burnin = 0.1, maxsamples = -1)
}
\arguments{
\item{filename}{The logfile.}

\item{burnin}{Discard this percentage of samples.}

\item{maxamples}{If > 0 stop after reading in this many lines (only for testing).}
}
\description{
Read in BEAST2 logfile
}


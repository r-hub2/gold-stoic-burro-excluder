% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qualtrics_data.R
\docType{data}
\name{qualtrics_numeric}
\alias{qualtrics_numeric}
\title{Example numeric metadata from simulated Qualtrics study}
\format{
A data frame with 100 rows and 16 variables:
\describe{
\item{StartDate}{date and time data collection started, in ISO 8601 format}
\item{EndDate}{date and time data collection ended, in ISO 8601 format}
\item{Status}{numeric flag for preview (1) vs. implemented survey (0)
entries}
\item{IPAddress}{participant IP address (truncated for anonymity)}
\item{Progress}{percentage of survey completed}
\item{Duration (in seconds)}{duration of time required to complete survey,
in seconds}
\item{Finished}{numeric flag for whether survey was completed (1) or
progress was < 100 (0)}
\item{RecordedDate}{date and time survey was recorded, in ISO 8601 format}
\item{ResponseId}{random ID for participants}
\item{LocationLatitude}{latitude geolocated from IP address}
\item{LocationLongitude}{longitude geolocated from IP address}
\item{UserLanguage}{language set in Qualtrics}
\item{Browser}{user web browser type}
\item{Version}{user web browser version}
\item{Operating System}{user operating system}
\item{Resolution}{user screen resolution}
}
}
\usage{
qualtrics_numeric
}
\description{
A dataset containing the metadata from a standard Qualtrics survey with
browser metadata collected and exported with "Use numeric values".
These data were randomly generated using \href{https://hrbrmstr.github.io/iptools/reference/ip_random.html}{iptools::ip_random()} and
\href{https://cran.r-project.org/src/contrib/Archive/rgeolocate/}{rgeolocate::ip2location()} functions.
}
\seealso{
Other data: 
\code{\link{qualtrics_fetch}},
\code{\link{qualtrics_fetch2}},
\code{\link{qualtrics_raw}},
\code{\link{qualtrics_text}}
}
\concept{data}
\keyword{datasets}

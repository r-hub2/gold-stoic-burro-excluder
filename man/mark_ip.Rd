% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ip.R
\name{mark_ip}
\alias{mark_ip}
\title{Mark IP addresses from outside of a specified country.}
\usage{
mark_ip(
  x,
  id_col = "ResponseId",
  ip_col = "IPAddress",
  rename = TRUE,
  country = "US",
  include_na = FALSE,
  quiet = FALSE,
  print = TRUE
)
}
\arguments{
\item{x}{Data frame or tibble (preferably imported from Qualtrics using
\{qualtRics\}).}

\item{id_col}{Column name for unique row ID (e.g., participant).}

\item{ip_col}{Column name for IP addresses.}

\item{rename}{Logical indicating whether to rename columns (using \code{\link[=rename_columns]{rename_columns()}})}

\item{country}{Two-letter abbreviation of country to check (default is "US").}

\item{include_na}{Logical indicating whether to include rows with NA in
IP address column in the output list of potentially excluded data.}

\item{quiet}{Logical indicating whether to print message to console.}

\item{print}{Logical indicating whether to print returned tibble to
console.}
}
\value{
An object of the same type as \code{x} that includes a column marking rows
with IP addresses outside of the specified country.
For a function that checks these rows, use \code{\link[=check_ip]{check_ip()}}.
For a function that excludes these rows, use \code{\link[=exclude_ip]{exclude_ip()}}.
}
\description{
The \code{mark_ip()} function creates a column labeling
rows of data that have IP addresses from outside the specified country.
The function is written to work with data from
\href{https://www.qualtrics.com/}{Qualtrics} surveys.
}
\details{
To record this information in your Qualtrics survey, you must ensure that
\href{https://www.qualtrics.com/support/survey-platform/survey-module/survey-options/survey-protection/#AnonymizingResponses}{Anonymize responses is disabled}.

Default column names are set based on output from the
\href{https://docs.ropensci.org/qualtRics/reference/fetch_survey.html}{\code{qualtRics::fetch_survey()}}.
The function uses \code{\link[ipaddress:country_networks]{ipaddress::country_networks()}} to assign IP addresses to
specific countries using
\href{https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2}{ISO 3166-1 alpha-2 country codes}.

The function outputs to console a message about the number of rows
with IP addresses outside of the specified country. If there are \code{NA}s for IP
addresses (likely due to including preview data---see \code{\link[=check_preview]{check_preview()}}), it
will print a message alerting to the number of rows with \code{NA}s.
}
\note{
This function \strong{requires internet connectivity} as it uses the
\code{\link[ipaddress:country_networks]{ipaddress::country_networks()}} function, which pulls daily updated data
from \url{https://www.iwik.org/ipcountry/}. It only updates the data once
per session, as it caches the results for future work during the session.
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Mark IP addresses outside of the US
data(qualtrics_text)
df <- mark_ip(qualtrics_text)

# Remove preview data first
df <- qualtrics_text \%>\%
  exclude_preview() \%>\%
  mark_ip()

# Mark IP addresses outside of Germany
df <- qualtrics_text \%>\%
  exclude_preview() \%>\%
  mark_ip(country = "DE")
\dontshow{\}) # examplesIf}
}
\seealso{
Other ip functions: 
\code{\link{check_ip}()},
\code{\link{exclude_ip}()}

Other mark functions: 
\code{\link{mark_duplicates}()},
\code{\link{mark_duration}()},
\code{\link{mark_location}()},
\code{\link{mark_preview}()},
\code{\link{mark_progress}()},
\code{\link{mark_resolution}()}
}
\concept{ip functions}
\concept{mark functions}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/population.R
\name{getFuturePopulation}
\alias{getFuturePopulation}
\title{Future population}
\usage{
getFuturePopulation(api_key, prefCode)
}
\arguments{
\item{api_key}{Your API application key}

\item{prefCode}{Code of a prefecture}
}
\value{
This function returns \code{data.frame} including columns:
\itemize{
 \item cityCode
 \item cityName
 \item value
 \item ratio
 \item prefCode
 \item year
}
}
\description{
Estimated population of a given prefecture in 2040
}
\examples{
\dontrun{
 getFuturePopulation(api_key, prefCode = 1)
}

}
\seealso{
\url{https://opendata.resas-portal.go.jp/docs/api/v1/population/future/cities.html}
}
\author{
Koki Ando <koki.25.ando@gmail.gmail>
}

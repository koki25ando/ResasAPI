#' The number of foreigners who visited a given prefecture
#' 
#' This function provides the number of foreigners who visited a given prefecture. 
#' Also provides where they are from and when they visited.
#' 
#' @param api_key Your API application key
#' @param purpose Purpose of visiting. Defaults 1. 1 means "ALL", 2 means "Sightseeing or Leisure".
#' @param year Year. Years from 2011 to 2016 are only valid. Defaults 2012.
#' @param prefCode Prefecture code
#' 
#' @author Koki Ando
#' 
#' @import RCurl
#' @import jsonlite
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/foreigners/forFrom.html}
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item year
#'  \item quarter
#'  \item value
#'  \item Country
#' }
#' 
#' @examples
#' \dontrun{
#'   getTourismStats(api_key, year = 2013, prefCode=26)
#' }
#'
#' @export


getTourismStats <- function(api_key, purpose=1, year=2012, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/foreigners/forFrom?purpose="
  
  getdata.json <- RCurl::getURL(paste0(base_url, purpose, "&year=", year, "&prefCode=", prefCode),
                                httpheader = paste('X-API-KEY:', api_key))
  Country_list <- jsonlite::fromJSON(getdata.json)$result$changes$countryName
  data_list = jsonlite::fromJSON(getdata.json)$result$changes$data
  for (i in 1:length(data_list)){
    data_list[[i]]$Country <- Country_list[[i]]
  }
  do.call(rbind, data_list)
}

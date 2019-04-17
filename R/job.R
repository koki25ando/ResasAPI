#' Wages per capita per year
#' 
#' Wages per capita per year of a given prefecture
#' 
#' @param api_key Your API application key
#' @param prefCode Code of prefecture
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/municipality/wages/perYear.html}
#' 
#' @examples
#' \dontrun{
#'  getWages(api_key, prefCode = 11, wagesAge = 1)
#' }
#' 
#' @export

getWages = function(api_key, prefCode, wagesAge = 1){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/municipality/wages/perYear?prefCode="
  getdata.json<-RCurl::getURL(paste0(base_url, prefCode, '&simcCode=', "-", "&wagesAge=", wagesAge, "&sicCode=", "-"),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  pref = data$result$prefName
  data.frame(data$result$data, prefCode, pref)
}
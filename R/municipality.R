#' Fiancial information of specific municipality
#' 
#' Settlement amount ratio of each category for a municipality 
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param year Specific number of fiscal year
#' @param prefCode Code of prefecture
#' @param cityCode Code of municipality
#' @param matter Specified are code
#' 
#' @return This function returns time series \code{data.frame} including columns: 
#' \itemize{
#'  \item label
#'  \item value
#'  \item year
#'  \item prefCode
#'  \item pref
#'  \item cityCode
#'  \item city
#' }
#' 
#' @examples
#' \dontrun{
#'  getSettlementAmount(api_key, year = 2015, prefCode=26, cityCode=26100)
#' }
#'
#' @export

getSettlementAmount = function(api_key, year, prefCode, cityCode, matter = 1){
  
  base_url = "https://opendata.resas-portal.go.jp/api/v1/municipality/finance/forSettlementAmount?year="
  getdata.json<-RCurl::getURL(paste0(base_url, year, "&prefCode=", prefCode,"&cityCode=", cityCode,"&matter=", matter),
                              httpheader = paste('X-API-KEY:', api_key))
  
  data <- jsonlite::fromJSON(getdata.json)$result$years$data
  city = jsonlite::fromJSON(getdata.json)$result$cityName
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  finance_df = data.frame(data, year, prefCode, pref, cityCode, city) %>% 
    dplyr::select(-code)
  return(finance_df)
}

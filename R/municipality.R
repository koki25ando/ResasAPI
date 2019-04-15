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
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/municipality/finance/forSettlementAmount.html}
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
  finance_df
}


#' Local taxes per year
#' 
#' Local taxes (thousands) per capita per year of specific municipality
#' 
#' @author Koki Ando <koki.25.ando@gmail.co>
#' 
#' @param api_key Your API application key
#' @param prefCode Code of prefecture
#' @param cityCode Code of city
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/municipality/taxes/perYear.html}
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item year
#'  \item value
#'  \item prefCode
#'  \item pref
#'  \item cityCode
#'  \item city
#' }
#' 
#' @examples
#' \dontrun{
#'  getLocalTexes(api_key, prefCode=11, cityCode=11362)
#' }
#' 
#' @export

getLocalTexes = function(){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/municipality/taxes/perYear?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  city = jsonlite::fromJSON(getdata.json)$result$cityName
  localtaxes_df = data.frame(data, prefCode, pref, cityCode, city)
  localtaxes_df
}


#' Resident tax corporate
#' 
#' Resident tax corporate per capita per year of a given municipality from 2008 to 2016
#' 
#' @param api_key Your API application key
#' @param cityCode Code of city
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/municipality/residentTaxCorporate/perYear.html}
#' 
#' @examples
#' \dontrun{
#'  getResidentTax(api_key, cityCode = 11362)
#' }
#' 
#' @export

getResidentTax = function(api_key, cityCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/municipality/residentTaxCorporate/perYear?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode),
                              httpheader = paste('X-API-KEY:', api_key))
  
  data <- jsonlite::fromJSON(getdata.json)$result$data
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  city = jsonlite::fromJSON(getdata.json)$result$cityName
  taxcorporate_df = data.frame(data, prefCode, pref, cityCode, city)
  taxcorporate_df
}


#' Property Tax
#' 
#' Property tax per capita per year of a given municipality from 2008 to 2016
#' 
#' @param api_key Your API application key
#' @param cityCode Code of city
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/municipality/propertyTax/perYear.html}
#' 
#' @examples
#' \dontrun{
#'  getPropertyTax(api_key, cityCode = 11362)
#' }
#' 
#' @export

getPropertyTax = function(api_key, cityCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/municipality/propertyTax/perYear?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  city = jsonlite::fromJSON(getdata.json)$result$cityName
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  protax_df = data.frame(data, cityCode, city, pref)
  protax_df
}

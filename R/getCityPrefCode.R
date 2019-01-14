#'
#'
#'
#'
#' @examples
#' \dontrun{
#'   getCityPrefCode(api_key='****************************************', 
#'   pref='北海道')
#' }
#' 
#' @export



getCityPrefCode <- function(api_key, pref="東京都"){
  base_url<-'https://opendata.resas-portal.go.jp/'
  api<-'api/v1-rc.1/prefectures'
  api_key = api_key
  
  getdata.json<-RCurl::getURL(paste0(base_url, api), 
                       httpheader = paste('X-API-KEY:', api_key))
  prefectureCode <- jsonlite::fromJSON(getdata.json)$result %>%
    dplyr::filter(prefName == pref) %>% 
    dplyr::select(prefCode)
  
  city_param = "api/v1/cities?prefCode="
  city_rawdata <- RCurl::getURL(paste0(base_url, city_param, prefectureCode),
         httpheader = paste('X-API-KEY:', api_key))
  jsonlite::fromJSON(city_rawdata)$result
}

#'
#' @param api_key 
#' @param cityCode
#' @param prefCode
#' 
#' @author Koki Ando
#' 
#' @import RCurl
#' @import jsonlite
#' @import dplyr
#' @import magrittr
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item 年
#'  \item 総人口
#'  \item 年少人口
#'  \item 年少人口比率
#'  \item 生産年齢人口
#'  \item 生産年齢人口比率
#'  \item 老年人口
#'  \item 老年人口比率
#'  \item cityCode
#'  \item prefCode
#' }
#'
#' @examples
#' \dontrun{
#'   getPopulationStats(api_key, cityCode=26100, prefCode=26)
#' }
#' 
#' @export

getPopulationStats <- function(api_key, cityCode, prefCode){
  base_url<-'https://opendata.resas-portal.go.jp/'
  api<-'api/v1/population/composition/perYear?cityCode='
  getdata.json<-RCurl::getURL(paste0(base_url, api, cityCode, '&prefCode=', prefCode), 
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  df <- do.call(cbind, data$data) %>% 
    data.frame()
  names(df)[1] <- "年"
  df <- df %>% 
    plyr::select(-contains("year"))
  names(df) <- c("年", "総人口", "年少人口", "年少人口比率", "生産年齢人口", "生産年齢人口比率", "老年人口", "老年人口比率")
  df %>% 
    plyr::mutate(cityCode = cityCode, prefCode = prefCode)
}


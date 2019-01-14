#' 指定地域への国籍別訪問者数
#' 
#' 地域単位、年単位の外国人訪問者数を返します。
#' 
#' @param api_key
#' @param purpose
#' @param year
#' @param prefCode
#' 
#' @author Koki Ando
#' 
#' @seealso <https://opendata.resas-portal.go.jp/docs/api/v1/tourism/foreigners/forFrom.html>
#' 
#' @examples
#' \dontrun{
#'   getTourismStats(api_key, year = 2013, prefCode=26)
#' }
#'
#' @export


getTourismStats <- function(api_key, purpose=1, year=2012, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/foreigners/forFrom?purpose="
  
  getdata.json <- getURL(paste0(base_url, purpose, "&year=", year, "&prefCode=", prefCode),
                         httpheader = paste('X-API-KEY:', api_key))
  Country_list <- fromJSON(getdata.json)$result$changes$countryName
  data_list = fromJSON(getdata.json)$result$changes$data
  for (i in 1:length(data_list)){
    data_list[[i]]$Country <- Country_list[[i]]
  }
  do.call(rbind, data_list)
}
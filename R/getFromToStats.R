#'
#' @paramm api_key Your API application key
#' 
#' @author Koki Ando
#'
#' @import RCurl
#' @import jsonlite
#' 
#' @examples
#' \dontrun{
#'   
#' }
#'
#'
#' @export

getFromToStats <- function(api_key){
  base_url = 'https://opendata.resas-portal.go.jp'
  param = '/result/total'
  
  raw_data <- RCurl::getURL(paste0(base_url, param), 
                            httpheader = paste('X-API-KEY:', api_key),
                            ssl.verifypeer = FALSE)
  data <- jsonlite::fromJSON(raw_data)
}
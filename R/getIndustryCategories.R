#' Indusry or Job Code
#' 
#' Get data of industry or job codes
#'
#' @param api_key Your API application key
#' @param category Category of code. valid values are 職業 or 産業
#' @param size Size of code. Valid values are 大, 中 or 小
#' 
#' @author Koki Ando
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item iscoCode
#'  \item iscoName
#' }
#' 
#' @examples
#' \dontrun{
#'   getIndustryJobCode(api_key="*******", 
#'                      category = "職業", size = "大")
#' }
#' 
#' @export 

getIndustryJobCode(api_key, category="産業", size = "大")

getIndustryJobCode <- function(api_key, category = c("産業", "職業"), 
                               size = c("大", "中", "小")){
  base_url<-'https://opendata.resas-portal.go.jp/'
  
  if (category == "産業"){
    category_key = "industries"
  } else if (category == "職業") {
    category_key = "jobs"
  } else {
    print("産業、職業より選んでください。")
  }
  
  if (size == "大") {
    size_key = "broad"
  } else if (size == "中"){
    size_key = "middle"
  } else if (size == "小"){
    size_key = "narrow"
  } else {
    print("大、中、小の中より選んでください。")
  }
  
  api = paste0("api/v1/", category_key, "/", size_key)
  getdata.json<-RCurl::getURL(paste0(base_url, api), 
                              httpheader = paste('X-API-KEY:', api_key))
  jsonlite::fromJSON(getdata.json)$result
}

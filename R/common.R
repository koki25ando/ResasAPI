#' List of Prefectures
#' 
#' Prefectures' codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item prefCode
#'  \item prefName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/prefectures.html}
#' 
#' @examples
#' \dontrun{
#'  getPrefectures(api_key)
#' }
#' 
#' @export

getPrefectures = function(api_key){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/prefectures"
  getdata.json<-RCurl::getURL(paste0(base_url),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}



#' List of Cities
#' 
#' Cities' codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param prefCode Code of a prefecture
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item prefCode
#'  \item cityCode
#'  \item cityName
#'  \item bigCityFlag
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/cities.html}
#' 
#' @examples
#' \dontrun{
#'  getCities(api_key, prefCode = 1)
#' }
#' 
#' @export

getCities = function(api_key, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/cities?prefCode="
  getdata.json<-RCurl::getURL(paste0(base_url, prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}

#' Broad Industry Category
#' 
#' List of broad industry category codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item sicCode
#'  \item sicName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/industries/broad.html}
#' 
#' @examples
#' \dontrun{
#'  getBroadIndustries(api_key)
#' }
#' 
#' @export

getBroadIndustries = function(api_key){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/industries/broad"
  getdata.json<-RCurl::getURL(paste0(base_url),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}

#' Middle Industry Category
#' 
#' Middle industry category codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param sicCode Industry broad code
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item simcCode
#'  \item sicCode
#'  \item simcName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/industries/middle.html}
#' 
#' @examples
#' \dontrun{
#'  getMiddleIndustries(api_key, sicCode = "E")
#' }
#' 
#' @export

getMiddleIndustries = function(api_key, sicCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/industries/middle?sicCode="
  getdata.json<-RCurl::getURL(paste0(base_url, sicCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}

#' Narrow Industry Categories
#' 
#' Narrow industry category codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param simcCode Industry middle code
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item siscCode
#'  \item simcCode
#'  \item sidcName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/industries/narrow.html}
#' 
#' @examples
#' \dontrun{
#'  getNarroaIndustries(api_key, simcCode = 20)
#' }
#' 
#' @export

getNarroaIndustries = function(api_key, simcCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/industries/narrow?simcCode="
  getdata.json<-RCurl::getURL(paste0(base_url, simcCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}

#' Broad Job Category
#' 
#' Broad job category codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item iscoCode
#'  \item iscoName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/jobs/broad.html}
#' 
#' @examples
#' \dontrun{
#'  getBroadJobs(api_key)
#' }
#' 
#' @export

getBroadJobs = function(api_key){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/jobs/broad"
  getdata.json<-RCurl::getURL(paste0(base_url),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}




#' Middle Job Category
#' 
#' Middle job category codes
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param iscoCode Code of broad job
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item iscoCode
#'  \item ismcoCode
#'  \item iscoName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/jobs/middle.html}
#' 
#' @examples
#' \dontrun{
#'  getMiddleJobs(api_key, iscoCode = "B")
#' }
#' 
#' @export

getMiddleJobs = function(api_key, iscoCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/jobs/middle?iscoCode="
  getdata.json<-RCurl::getURL(paste0(base_url, iscoCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}



#' Agriculture Departments Code
#' 
#' Agriculture departments code
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item sectionCode
#'  \item sectionName
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/regions/agricultureDepartments.html}
#' 
#' @examples
#' \dontrun{
#'  getAgricultureDepartments(api_key)
#' }
#' 
#' @export

getAgricultureDepartments = function(api_key){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/regions/agricultureDepartments"
  getdata.json<-RCurl::getURL(paste0(base_url),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)
  data$result
}
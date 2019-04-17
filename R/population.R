#' Future population
#' 
#' Estimated population of a given prefecture in 2040
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/population/future/cities.html}
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item cityCode
#'  \item cityName
#'  \item value
#'  \item ratio
#'  \item prefCode
#'  \item year
#' }
#' 
#' @examples
#' \dontrun{
#'  getFuturePopulation(api_key, prefCode = 1)
#' }
#' 
#' @export

getFuturePopulation = function(api_key, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/population/future/cities?year="
  getdata.json<-RCurl::getURL(paste0(base_url, "2040", "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$cities
  main_df = data.frame(data)
  main_df$prefCode = prefCode
  main_df$year = 2040
  main_df
}

#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export


#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export


#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export


#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export


#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export


#' 
#' 
#' @param api_key Your API application key
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{}
#' 
#' @examples
#' \dontrun{
#'  
#' }
#' 
#' @export



#' Future population
#' 
#' Estimated population of a given prefecture in 2040
#' 
#' @param api_key Your API application key
#' @param prefCode Code of a prefecture
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

#' Population Composition
#' 
#' Population composition data of a given prefecture in 2015
#' 
#' @param api_key Your API application key
#' @param prefCode Code of a prefecture
#' @param cityCode Code of a city. "-" returns all the cities
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/population/composition/perYear.html}
#' 
#' @examples
#' \dontrun{
#'  getPopulationComposition(api_key, prefCode = 1, cityCode = "-")
#' }
#' 
#' @export


getPopulationComposition = function(api_key, prefCode, cityCode = "-"){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/population/composition/perYear?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  
  data_list = list()
  for (i in 1:length(data$label)){
    data_list[[i]] = data.frame(data$data[i], data$label[i])
  }
  main_df = do.call(rbind, data_list[-1])
  main_df$prefCode = prefCode
  names(main_df)[4] = "type"
  main_df
}

#' Population Pyramid
#' 
#' Population pyramid data of a given prefecture and municipality in a 2 different years
#' 
#' @param api_key Your API application key
#' @param cityCode Code of a city. "-" returns all the cities
#' @param prefCode Code of a prefecture
#' @param yearLeft Year number 1
#' @param yearRight Year number 2
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item class
#'  \item man
#'  \item manPercent
#'  \item woman
#'  \item womanPercent
#'  \item year
#'  \item type
#'  \item prefCode
#' }
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/population/composition/pyramid.html}
#' 
#' @examples
#' \dontrun{
#'  getPopulationPyramid(api_key, cityCode, prefCode = 1, yearLeft = 2020, yearRight = 2030)
#' }
#' 
#' @export

getPopulationPyramid = function(api_key, cityCode = "-", prefCode, yearLeft, yearRight){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/population/composition/pyramid?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode, "&yearRight=", yearRight, "&prefCode=", prefCode, "&yearLeft=", yearLeft),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result
  left_df = data.frame(data$yearLeft$data, data$yearRight$year)
  right_df = data.frame(data$yearRight$data, data$yearRight$year)
  names(left_df)[6] = "year"
  names(right_df)[6] = "year"
  left_df$type = "left"
  right_df$type = "right"
  main_df = rbind(left_df, right_df)
  main_df$prefCode = prefCode
  main_df
}


#' Population Change
#' 
#' Population change data every 5 years from 1985 to 2040
#' 
#' @param api_key Your API application key
#' @param prefCode Code of a prefecture
#' @param cityCode Code of a city. "-" return all the cities
#' 
#' @author Koki Ando <koki.25.ando@gmail.gmail>
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/population/sum/perYear.html}
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item label
#'  \item value
#'  \item year
#'  \item prefCode
#' }
#' 
#' @examples
#' \dontrun{
#'  getPopulationChange(api_key, prefCode = 1, cityCode = "-")
#' }
#' 
#' @export

getPopulationChange = function(api_key, prefCode, cityCode = "-"){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/population/sum/perYear?cityCode="
  getdata.json<-RCurl::getURL(paste0(base_url, cityCode,  "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$bar$data
  data_list = list()
  for (i in 1:length(data$year)){
    data_list[[i]] = data.frame(data$class[i], data$year[i])
  }
  
  main_df = do.call(rbind, data_list)
  names(main_df)[3] = "year"
  main_df$prefCode = prefCode
  dplyr::arrange(main_df, label)
}
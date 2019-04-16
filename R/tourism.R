#' Foreigners visiting specified place
#' 
#' The number of foreigners visiting a specified place per year
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param year
#' @param prefCode
#' @param purpose
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/foreigners/forFrom.html}
#' 
#' @examples
#' \dontrun{
#'  get(api_key, year = "2012", prefCode = "11", purpose= "1")
#' }
#' 
#' @export

getForeiners = function(api_key, year, prefCode, purpose){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/foreigners/forFrom?purpose="
  getdata.json<-RCurl::getURL(paste0(base_url, purpose, "&year=", year, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$changes
  countries = data$countryName
  data_list = list()
  for (i in 1:length(data$data)){
    data_list[[i]] = data.frame(countries[i], data$data[[i]])
  }
  country_df = do.call(rbind, data_list)
  names(country_df)[1] = "country"
  country_df
}

#' 
#' @author Koki Ando <koki.25.andog@gmail.com>
#' 
#' @param api_key Your API application key
#' @param display
#' @param unit
#' @param prefCode Code of prefecture
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/guestRoomLine.html}
#' 
#' @examples
#' \dontrun{
#'  getHotelOperationRate{api_key, display = 2, unit = 0, prefCode = 1}
#' }
#' @export

getHotelOperationRate = function(api_key, display, unit, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/hotelAnalysis/guestRoomLine?display="
  getdata.json<-RCurl::getURL(paste0(base_url, display, "&unit=", unit, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$changes
  data_list = list()
  for (i in 1:length(data$data)){
    data_list[[i]] = data.frame(data$label[i], data$data[[i]])
  }
  main_df = do.call(rbind, data_list)
  names(main_df)[1] = "type"
  data.frame(main_df, prefCode)
}


#' 
#' 
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/groupStack.html}
#' 
#' @examples
#' \dontrun{
#'  getGuestsNum(api_key, matter = 1, display = 1, unit = 0, prefCode = 1)
#' }
#' 
#' @export

getGuestsNum = function(api_key, matter, display, unit, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/hotelAnalysis/groupStack?matter="
  getdata.json<-RCurl::getURL(paste0(base_url, matter, "&display=", display, "&unit=", unit, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  main_df = data.frame(data, prefCode, pref)
  main_df
}

#'
#'
#'
#'
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/facilityStack.html}
#' 
#' @examples
#' \dontrun{
#'  getFacilityNum(api_key, display, unit, prefCode = 1)
#' }
#' 
#' @export

getFacilityNum = function(api_key, display, unit, prefCode){
  
}

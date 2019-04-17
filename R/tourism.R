#' Foreigners visiting specified place
#' 
#' The number of foreigners visiting a specified place per year
#' 
#' @author Koki Ando <koki.25.ando@gmail.com>
#' 
#' @param api_key Your API application key
#' @param year Number of year
#' @param prefCode Code of a prefectrue
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/foreigners/forFrom.html}
#' 
#' @return This function returns \code{data.fram} including columns:
#' \itemize{
#'  \item country
#'  \item year
#'  \item quater
#'  \item value
#' }
#' 
#' @examples
#' \dontrun{
#'  getForeignTourists(api_key, year = "2012", prefCode = "11")
#' }
#' 
#' @export

getForeignTourists = function(api_key, year, prefCode, purpose){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/foreigners/forFrom?purpose="
  getdata.json<-RCurl::getURL(paste0(base_url, "1", "&year=", year, "&prefCode=", prefCode),
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

#' Operation Rate
#' 
#' Operation rata data for multiple types of accomodation of a given prefecture from 2011 to 2017
#' 
#' @author Koki Ando <koki.25.andog@gmail.com>
#' 
#' @param api_key Your API application key
#' @param unit Unit 0 returns annual data, 1 returns monthly data
#' @param prefCode Code of prefecture
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/guestRoomLine.html}
#' 
#' @return This function returns \code{data.frame} including columns:
#' \itemize{
#'  \item type
#'  \item year
#'  \item month
#'  \item value
#'  \item prefCode
#' }
#' 
#' @examples
#' \dontrun{
#'  getHotelOperationRate(api_key, unit = 0, prefCode = 1)
#' }
#' 
#' @export

getHotelOperationRate = function(api_key, unit, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/hotelAnalysis/guestRoomLine?display="
  getdata.json<-RCurl::getURL(paste0(base_url, "2", "&unit=", unit, "&prefCode=", prefCode),
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


#' Number of guests
#' 
#' Number of guests stayed at different types of accomodations in a given prefecture from 2011 to 2017
#' 
#' @param api_key Your API application key
#' @param unit Unit: 0 returns annual data, 1 returns monthly data
#' @param prefCode Code of a given prefecture
#' 
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/groupStack.html}
#' 
#' @examples
#' \dontrun{
#'  getGuestsNum(api_key, unit = 1, prefCode = 1)
#' }
#' 
#' @export

getGuestsNum = function(api_key, unit, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/hotelAnalysis/groupStack?matter="
  getdata.json<-RCurl::getURL(paste0(base_url, "1", "&display=", "2", "&unit=", unit, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data
  pref = jsonlite::fromJSON(getdata.json)$result$prefName
  main_df = data.frame(data, prefCode, pref)
  names(main_df)[3:9] = c("total", "旅館", "リゾートホテル", "ビジネスホテル", "シティホテル", "会社・団体の宿泊所", "簡易宿所・その他")
  main_df
}

#' Facilities Number
#'
#' The number of facilities in a given prefecture from 2011 to 2017
#' 
#' @param api_key Your API application key
#' @param unit Unit: 0 returns anunal data, 1 returns monthly data
#' @param prefCode Code of a prefecture
#'
#' @seealso \url{https://opendata.resas-portal.go.jp/docs/api/v1/tourism/hotelAnalysis/facilityStack.html}
#' 
#' @return This function returns \code{data.frame} including columns: 
#' \itemize{
#'  \item type
#'  \item year
#'  \item month
#'  \item value
#'  \item prefCode
#' }
#' 
#' @examples
#' \dontrun{
#'  getFacilityNum(api_key, unit = 0, prefCode = 1)
#' }
#' 
#' @export

getFacilityNum = function(api_key, unit, prefCode){
  base_url = "https://opendata.resas-portal.go.jp/api/v1/tourism/hotelAnalysis/facilityStack?display="
  getdata.json<-RCurl::getURL(paste0(base_url, "2", "&unit=", unit, "&prefCode=", prefCode),
                              httpheader = paste('X-API-KEY:', api_key))
  data <- jsonlite::fromJSON(getdata.json)$result$data$years
  label = jsonlite::fromJSON(getdata.json)$result$data$label
  data_list = list()
  for (i in 1:length(data)){
    data_list[[i]] = data.frame(label[i], data[[i]])
  }
  main_df = do.call(rbind, data_list)
  names(main_df)[1] = "type"
  data.frame(main_df, prefCode)
}

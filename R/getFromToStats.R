

getFromToStats <- function(api_key){
  base_url = 'https://opendata.resas-portal.go.jp'
  param = '/result/total'
  
  raw_data <- getURL(paste0(url, param), 
                         httpheader = paste('X-API-KEY:', api_key),
                     ssl.verifypeer = FALSE)
  data <- fromJSON(raw_data)
}


getFromToStats(api_key)

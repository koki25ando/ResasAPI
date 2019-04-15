#' Employment Data
#' 
#' Data of employment data of a given prefecture in Japan
#'
#' @param api_key Your API application key
#' @param prefCode Code of a prefecture to fetch information for
#' 
#' @author Koki Ando
#' 
#' @import magrittr
#'
#' @examples
#' \dontrun{
#'  getEmploymentStat(api_key, prefCode = 26)
#' }
#' 
#' @export

getEmploymentStat <- function(api_key, prefCode){
  base_url<-'https://opendata.resas-portal.go.jp/'

  cat(paste0("都道府県コード", prefCode, "のどのデータを取得しますか？
         1: 一人当たり賃金
         2: 有効求人倍率
         3: 求人・求職者
         4: 介護需給地域別比較"))
  answer <- readline(prompt="データ番号: ")
  
  if (answer == 1){
    api = "api/v1/municipality/wages/perYear"
    simcCode = readline(prompt="産業大分類コードを入力して下さい: ")
    sicCode = readline(prompt="産業中分類コードを入力して下さい: ")
    
    cat("1: 総数
2: ~ 19歳
3: 20～24歳
4: 25～29歳
5: 30～34歳
6: 35～39歳
7: 40～44歳
8: 45～49歳
9: 50～54歳
10: 55～59歳
11: 60～64歳
12: 65～69歳
13: 70歳～")
    Age = readline(prompt="上記より対象年代を選び数字を入力してください: ")
    
    request_url = glue::glue(base_url, api, "?prefCode={prefCode}&simcCode={simcCode}&wagesAge={Age}&sicCode={sicCode}")
  } else if (answer == 2){
    api = "api/v1/municipality/job/perYear"
    simcCode = readline(prompt="産業大分類コードを入力して下さい: ")
    sicCode = readline(prompt="産業中分類コードを入力して下さい: ")
    
    request_url = glue::glue(base_url, api, "?ismcoCode={simcCode}&prefCode={prefCode}&iscoCode={sicCode}")
  } else if (answer == 3){
    api = "api/v1/regionalEmploy/analysis/portfolio"
    year = readline(prompt="年を選んでください: ")
    cat("1．有効求職者数（総数）
2．有効求職者数（男性）
3．有効求職者数（女性）
4．有効求人数
5．就職件数")
    matter = readline(prompt="表示内容を上記より選択して下さい: ")
    cat("1．職業大分類で見る
2．職業中分類で見る")
    class = readline(prompt="表示分類を上記より選択して下さい: ")
    request_url = glue::glue(base_url, api, "?prefCode={prefCode}&year={year}&matter={matter}&class={class}
")
  } else if (answer == 4){
    api = "api/v1/medicalWelfare/careAnalysis/chart"
    year = readline(prompt="年を選んでください: ")
    cat("1 : 介護需要
2 : 介護供給
3 : 介護保険料・介護費用")
    matter1 = readline(prompt="表示内容(大分類)を上記より選択して下さい: ")
    cat("101 : 介護サービス利用者数
102 : 要介護（要支援）認定者数
201 : 施設・事業所数
202 : 定員数
203 : 介護職員数
204 : 看護職員数
301 : 介護保険料（65歳以上の被保険者）
302 : 介護費用")
    matter2 = readline(prompt="表示内容(中分類)を上記より選択して下さい: ")
    cat("1 : 居宅サービス
2 : 住居系サービス
3 : 施設サービス")
    broad_category_cd = readline("表示分類コード(大分類)を上記より選択して下さい: ")
    cat("100 : (居宅サービス選択時)すべての中分類
101 : 訪問介護・介護予防訪問介護
102 : 訪問入浴介護・介護予防訪問入浴介護
103 : 訪問看護・介護予防訪問看護
104 : 訪問リハビリテーション・介護予防訪問リハビリテーション
200 : (住居系サービス)すべての中分類
201 : 認知症対応型共同生活介護
202 : 特定施設入居者生活介護・介護予防特定施設入居者生活介護
203 : 地域密着型特定施設入居者生活介護
300 : (施設サービス)すべての中分類
301 : 介護老人福祉施設
302 : 介護老人保険施設
303 : 介護療養型医療施設
304 : 地域密着型介護老人福祉施設入所者生活介護")
    middle_category_cd = readline("表示分類コード(中分類)を上記より選択して下さい: ")
    request_url = glue::glue(base_url, api, 
                       "?year={year}&disp_type=1&sort_type=1&matter_1={matter1}&matter_2={matter2}&broad_category_cd={broad_category_cd}&middle_category_cd={middle_category_cd}&prefCode={prefCode}&cityCode=-&insuranceCode=-")
  } else {
    pass
  } 
  
  getdata.json<-RCurl::getURL(request_url, 
                              httpheader = paste('X-API-KEY:', api_key))
  jsonlite::fromJSON(getdata.json)
  
}

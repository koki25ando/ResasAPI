# ResasAPI
RESAS(地域経済分析システム)のAPIをR経由で簡単に使用できるようにすることを目的に作られたRパッケージです。

## RESAS 地域経済分析システムとは
地域経済分析システムRESASとは、地域に関する官民のデーアを搭載し、誰もがわかりやすいように「見える化」したシステムです。
このシステムは、自治体職員のかたや、地域の活性化に関心を持つ様々な方によって、効果的な施策の立案・実行・検証のためなどに広く利用されています。
[RESAS　地域経済分析システム公式サイト ](https://resas.go.jp/#/1/01100)

## RESAS APIとは
RESAS APIは、[公式ページ](https://opendata.resas-portal.go.jp/form.html)より利用登録すれば利用が可能になります。

**当ResasAPIパッケージは地域分析システムのAPIを利用しておりますが、サービスの内容に関しては国によって保証されている訳ではございません。**

## チュートリアル

### 利用登録
ResasAPIパッケージを利用するには、必ずAPIキーを取得する必要がございますので、[こちら](https://opendata.resas-portal.go.jp/form.html)より利用申請を完了してくだい。

### パッケージインストール

ResasAPIは現在CRANに公開されていませんので、開発版をご利用下さい。

```{r}
devtools::install_github("koki25ando/ResasAPI")
```

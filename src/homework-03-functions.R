#----get_gender függvény--------------------------------------------------------
get_gender <- function(name){
  # A karakter nevének megadásakor adja vissza a karakter genderét!
  # Ha több neme van, vagy többször szerepel az adatbázisban,
  # akkor kiírja az összeset egy vektorban
  
  # a comic_characters$gsm oszlopból levágom a "Character" részt
  gsm <-
    lapply(strsplit(as.character(comic_characters$gsm), " Characters"), `[`, 1)
  # a comic_characters$sex oszlopból levágom a "Character" részt
  nem <-
    lapply(strsplit(as.character(comic_characters$sex), " Characters"), `[`, 1)
  # az előző két vektorból létrehozok egy listát
  gender<-
    list(gsm,nem)
  # az ifelse függvénnyel kiszedem a szükséges elemeket
  # indexeléssel szűrök a megadott névre
  # és hogyha a gsm oszlopban NA szerepel, akkor a sex oszlopban levőt írja ki
  nemek<-
    ifelse(is.na(gender[[1]][comic_characters$name==name])==TRUE,
         gender[[2]][comic_characters$name==name],
         gender[[1]][comic_characters$name==name])
  # a sapply függvénynel teszem meg, hogy a lehető legegyszerűbb formában
  # térjen vissza
  # nekünk vektor kell, ez a legegyszerűbb
  sapply(nemek,function(x) x)
}
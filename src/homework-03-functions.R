#----get_gender függvény--------------------------------------------------------
get_gender <- function(name){
  # A karakter nevének megadásakor adja vissza a karakter genderét!
  # Ha több neme van, vagy többször szerepel az adatbázisban,
  # akkor kiírja az összeset
  gender <- NA
  for(i in 1:nrow(comic_characters)){
    gender[i] <- comic_characters$gsm[i]
    
    if (is.na(gender[i])==TRUE){
      gender[i] <- comic_characters$sex[i]
    }
    
    if (comic_characters$name[i]==name){
      print(strsplit(gender, " Characters")[[i]][1])
    }
  }
}




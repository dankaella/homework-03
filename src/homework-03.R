############################
# Házi feladat 3           #
# Programozás I.           #
# 2016/17. II. félév       #
# Nagy Daniella            #
# 2017.03.18.              #
############################

#--- Függvények behívásának helye ----------------------------------------------
source("src/homework-03-functions.R")


#--- II. feladat ---------------------------------------------------------------

# 1. Lista készítése ami 5 vektort tartalmaz
# a sample függvénnyel kiválasztok a 10 és 20 közötti számokból egyet-egyet
# ez lesz a listában szereplő vektoraim hossza
# majd a runif függvénnyel létrehozok ilyen hosszúságú vektorokat az (1,2) 
# egyenletes eloszlásból.
mylist <- list(runif(sample(c(10:20),1),1,2),
               runif(sample(c(10:20),1),1,2),
               runif(sample(c(10:20),1),1,2),
               runif(sample(c(10:20),1),1,2),
               runif(sample(c(10:20),1),1,2))

# 2. For ciklussal megnézem, hogy milyen hosszúak a listában szereplő vektorok
hossz <- NA
for(i in 1:length(mylist)){
  hossz[i] <- length(mylist[[i]])
}
# kiiratom azt a vektor, amelynek elemei rendre a listában szereplő vektorok
# hosszai
hossz

# 3. Ugyanez apply függvénycsalád egy függvényével, listával térjen vissza
lapply(mylist, function(x) length(x))

# 4. Ugyanez apply függvénycsalád egy függvényével, vektorral térjen vissza
# listából vektort a sapply függvénnyel lehet kapni, itt a simplify=TRUE
# de ez a default, nem kell beállítani
sapply(mylist, function(x) length(x))

#--- III. feladat --------------------------------------------------------------

# 1. chickwts dataset behívása
data(chickwts)
head(chickwts)
# megnézem a datasetet, és az, hogy miről is szól
View(chickwts)
?chickwts

# 2. mennyi az átlagsúlya a különbözőképp táplált csirkéknek
# rögtön létrehozok belőle egy dataframet weight_mean névvel
weight_mean <- 
  aggregate(chickwts$weight, by = list(feed = chickwts$feed), mean)
# kiíratom
weight_mean

# 3. rendezem az átlagsúly szerint csökkenő sorrendbe
weight_mean[order(weight_mean$x,  decreasing = TRUE), ]

#--- IV. feladat ---------------------------------------------------------------

# 1. mátrix létrehozása (50 x 10), aminek értékei normális eloszlásból 
# származnak, és minden sor szórása egyenlő a sor számával
m <- matrix(NA,nrow=50,ncol=10)
for (i in 1:nrow(m)){
  m[i,]<-rnorm(ncol(m),mean=0,sd=i)
}

# 2. Minden sor szórásának kiszámítása for ciklussal, a végeredmény vektor
szoras <- NA
for (i in 1: nrow(m)){
  szoras[i] <-
    sd(m[i, ])
}
# kiiratom
szoras

# 3. most ugyanez az apply függvénycsalád egy tagjával
apply(m,1,sd)

# 4. normalizálom a mátrix értékeit -1-től 1-ig tartó intervallumra
# új mátrixba mentem
m2 <- 
  -1+2*(m-min(m))/(max(m)-min(m))
# megnézem a sorok átlagát
apply(m2,1,mean)

#--- V. feladat ----------------------------------------------------------------

# 1. fivethirtyeight package és comic_character dataset behívása/beolvasása
library(fivethirtyeight)
data(comic_characters)
head(comic_characters)
# dataset megtekintése
View(comic_characters)

# 2. name oszlop átalakítása, hogy a zárójeles rész ne legyen ott
# ehhez apply függvénycsalád egy tagját (sapply) használom
# azért ezt, mivel ez listákkal dolgozik, és a strsplit fv. outputja is lista
# plusz a sapply a lehető legegyszerűbb alakban tér vissza, ami nekünk jó.
comic_characters$name <-
  sapply(strsplit(as.character(comic_characters$name), "[ ][(]"), `[`, 1)

# 3. get_gender függvény létrehozása
# ez a függvény az homework-03-functions.R scriptben található

# 4. megnézem Thor, Katherine Pryde és Loki Laufeyson genderét!
get_gender("Thor")
get_gender("Katherine Pryde")
get_gender("Loki Laufeyson")

# VÉGE
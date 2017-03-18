############################
# Házi feladat 3           #
# Programozás I.           #
# 2016/17. II. félév       #
# Nagy Daniella            #
# 2017.03.18.              #
############################

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






View(iris)

# konumlarını kayıt etme
setosa <- which(iris$Species == "setosa")
versicolor <- which(iris$Species == "versicolor")
virginica <- which(iris$Species == "virginica")

# Sepal.Length ortalamalarını alıp değişkene atama
meanSetosa <- mean(iris[ setosa, c('Sepal.Length')])
meanVersicolor <- mean(iris[ versicolor, c('Sepal.Length')])
meanVirginica <- mean(iris[ virginica, c('Sepal.Length')])

# Üçünü aynı anda konsola yazdırma
meanSetosa;meanVersicolor;meanVirginica

# Petal.Length ortalamalarını alıp değişkene atama
meanSetosaPetalLength <- mean(iris[setosa,c('Petal.Length')])
meanVersicolorPetalLength <- mean(iris[versicolor,c('Petal.Length')])
meanVirginicaPetalLength <- mean(iris[virginica,c('Petal.Length')])

# Ortalama almanın daha kısa ve işlevsel hali

aggregate(iris, by = list(iris$Species),FUN = mean)
aggregate(iris[1:4], by = list(iris$Species),FUN = mean)

# Standart sapma için de uygulayabiliriz
aggregate(iris[1:4], by = list(iris$Species),FUN = sd)

# Toplama için
aggregate(iris[1:4], by = list(iris$Species),FUN = sum)

# NA değerleri silmek için fonksiyondan sonra na.rm ekliyoruz
aggregate(iris[1:4], by = list(iris$Species),FUN = mean, na.rm = T)

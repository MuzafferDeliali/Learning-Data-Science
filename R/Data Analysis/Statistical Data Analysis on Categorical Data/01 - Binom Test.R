#Binom Test

?binom.test

q1 <- SPSS_Gorus_Anketi$`Mesleğim gereği istatistik yazılımlarını kullanmayı öğrenmem gerekir.`
table(q1)

q1_Binom <- q1[q1 == "Katılıyorum"]
q1_Binom <- append(q1_Binom , q1[q1 == "Katılmıyorum"])

table(q1_Binom)

binom.test(x= 24 , n = 30 , p = 0.5)

# Hypotesis
# H0 : Katılıyorum rate is equal to 0.5
# Ha : Katılıyorum rate isn't equal to 0.5
# Ha is accepted

binom.test(x= 24 , n = 30 , p = 0.7 , alternative = "greater")

# Hypotesis
# H0 : Katılıyorum rate is equal or less then 0.7
# Ha : Katılıyorum rate is greater then 0.7
#with %85 probability it's greater than 0.7

binom.test(x= c(24,6) , n = 30 , p = 0.7 , alternative = "greater")
#returns same result 
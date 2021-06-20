# Scatter plot with 3 value

par(mar = c(5,5,5,6) , xpd = TRUE)
plot(x = airquality$Ozone , y = airquality$Temp ,
     main = "Ozone & Temp" ,
     xlab = "Ozone" ,
     ylab = "Tempreture" ,
     pch = 19 ,
     col = c("blue" , "red" , "green" , "black" , "purple" , "blue")[as.factor(airquality$Month)] ,
     bty = "L" ,
     cex = 1 , # with cex parameter we adjust text and sizes if we want to change dots only we have to use pt.cex
     )

legend(x = "topright" ,
       levels(as.factor(airquality$Month)) ,
       col = c("blue" , "red" , "green" , "black" , "purple" , "blue") ,
       pch = 19 ,
       inset = c(-0.2,0) 
       )

# Scatter plot with 4 value

par(mar = c(5,5,5,5) , xpd = TRUE)
plot(x = airquality$Ozone , y = airquality$Temp ,
     main = "Ozone & Temp" ,
     xlab = "Ozone" ,
     ylab = "Tempreture" ,
     pch = 19 ,
     col = c("blue" , "red" , "green" , "black" , "purple" , "blue")[as.factor(airquality$Month)] ,
     bty = "L" ,
     cex = airquality$Wind/10 ,# by giving wind values we changed dot sizes by wind
                               # That means dot's sizes reprehends wind
                              
)

legend(x = "topright" ,legend = levels(as.factor(airquality$Month)) ,
       title = "Months" ,
       col = c("blue" , "red" , "green" , "black" , "purple" , "black") ,
       pch = 19 ,
       inset = c(-0.2,0) 
)

legend(x = "topright" , legend = c("Low" , "Avarage" , "Extrame") ,
       title = "Wind Levels" ,
       cex = 0.8 , # Text and dot size
       pt.cex = c(0.20 , 0.95 , 1.8) , # Dot size
       pch = 19 ,
       inset = c(-0.2 , 0.55) 
       )
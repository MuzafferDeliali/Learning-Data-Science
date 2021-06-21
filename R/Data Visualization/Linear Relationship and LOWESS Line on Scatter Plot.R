# Linear Relationship and LOWESS Line on Scatter Plot
                          # LOWESS AKA local polynomial regression or known as moving regression 
                          # LOESS (locally estimated scatter plot smoothing) and LOWESS (locally weighted scatter plot smoothing)

colours <- c("blue" , "orange" , "pink" , "gray" , "black")

airquality <- na.omit(airquality) # Now we are get rid of NA lines

par(mar = c(5,5,5,7.2) , xpd = FALSE) # If xpd is true the linear line will also expand outside of the our chart
plot(x = airquality$Ozone , y = airquality$Temp ,
     main = "Ozone - Tempeture Relations" ,
     xlab = "Ozone" ,
     ylab = "Tempeture" ,
     pch = 19 ,
     bty = "L" ,
     col = colours[as.factor(airquality$Month)] ,
     cex = airquality$Wind/10 
     )

abline( lm(airquality$Temp ~ airquality$Ozone) , lwd = 2 , lty = "dotted" , col = "red" ) # size ,style and color adjustment
# First you have type plot y(Dependent variable) and than x(independent variable)
# lm stands for Linear Model  and "~" stand for linear model 

# Before lowess make sure you don't have any NA values otherwise it won't work
lines(lowess(airquality$Ozone , airquality$Temp) , lwd = 2 , col = "blue") # And now we find curve dots with lowess and applied it with lines()
                                                                      # Ozone and temperature relationship after ozone reach 100 temperature stabilizes

par( xpd = TRUE) # Read 7th line first. We still want to use our legends outside of the chart , that's why we use expand again. 
                 # Otherwise legends would be outside of the char

legend(x = "topright" , legend = levels(as.factor(airquality$Month)) ,
       title = "Months" ,
       col = colours ,
       pch = 19 ,
       inset = c(-0.2 , 0 )
       )

legend(x = "topright" , legend = c("Low" , "Avarage" , "Very") ,
       title = "Wind Levels" ,
       col = "black" ,
       pch = 19 ,
       cex = 0.8 ,
       pt.cex = c(0.2 , 0.9 , 2) ,
       inset = c(-0.2 , 0.6)
       )




# As we see with line Ozone effect Tempeture and this is makes Tempeture higher
# Note normally it's x and y but if you saw "~" mark the left side will be y and right side is x


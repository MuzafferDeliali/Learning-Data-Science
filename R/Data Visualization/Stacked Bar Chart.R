# Stacked Bar Chart

View(mtcars)

table(mtcars$gear , mtcars$cyl)

t <- table(mtcars$gear , mtcars$cyl)

par(mar = c(5,5,5,7) , xpd = TRUE)

barplot( t ,
         names.arg = c("4 Cyl" , "6 Cyl" , "8 Cyl") ,
         axis.lty = 1 ,
         main = "Stacked Bar Graph Example" ,
         xlab = "Cylinder" ,
         ylab = "Gear" ,
         col = c( "yellow", "orange" , "red" ) ) # in this case it is sorted as y-axis values 3,4,5

# On bar plot legend can be inside of Bar Plot function
legend(x = "topright" , levels(as.factor(mtcars$cyl)) ,
       title = "Cylinder" ,
       col = c( "yellow", "orange" , "red" ) ,
       pch = 15 ,
       inset = c(-0.15 , 0.1))

# Example Bar Plot
# args.legend Does same thing with legends but this is usable in bar plot and inset it non usable
par(mar = c(5,5,5,7) , xpd = TRUE)

barplot( t ,
         names.arg = c("4 Cyl" , "6 Cyl" , "8 Cyl") ,
         axis.lty = 1 ,
         main = "Stacked Bar Graph Example" ,
         xlab = "Cylinder" ,
         ylab = "Gear" ,
         col = c( "yellow", "orange" , "red" ) ,
         legend = c("4 Cyl" , "6 Cyl" , "8 Cyl") ,
         args.legend = list(bty = "o" ,
                            horiz = TRUE , # Now horizontal
                            xjust = 0.25 ,  # Now were change location
                            yjust = -2.5 ,
                            cex = 0.8) #size of text 
         )


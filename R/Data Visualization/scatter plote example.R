
colors <- c("blue" , "red" , "green" , "black" , "purple" , "cornsilk" , "pink" , "yellow" , "cyan" , "brown")

par(mar = c(5,5,5,5) , xpd = TRUE)
plot(x = chess$Standard_Rating , y = chess$Rapid_rating ,
     bty = "L" ,
     xlab = "Standard Rating" ,
     ylab = "Rabid Rating" ,
     cex = 0.3 ,
     pch = 19 ,
     col = colors[as.factor(chess$Title)]
     )

legend(x = "bottomleft" , legend = levels(as.factor(chess$Title)) ,
       title = "Titles" ,
       pch = 19 ,
       col = colors ,
       cex = 0.7 ,
       inset = c(-0.23 , -0.3) 
       )

par( xpd = FALSE) 
abline( lm(chess$Standard_Rating ~ chess$Rapid_rating))

unique(chess$Title)
colors

# Dumb None ctrl shift d copies lines to bottom i don't know why i never heard it
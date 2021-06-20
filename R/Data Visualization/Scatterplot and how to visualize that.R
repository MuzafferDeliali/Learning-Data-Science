# Scatterplot

View(airquality)

plot(airquality$Ozone , bty = "L" , pch = 2 , type = "h") 
# The bty option of the par() method allows the custom of the box around the plot. The shape of the letter represents the boundaries.
# The pch option changes dots to triangle. We can also change it to something else by giving value as "+"
# The type option changes the for example type h gives histogram view. Default value is p

plot(airquality$Ozone , airquality$Temp , 
     pch = 19 , 
     type = "p" , 
     main = "Ozon - Temp" , # Ozon-Temp graph
     xlab = "Ozon" ,
     ylab = "Temperature" ,
     bty = "L") 


# How to colorise scatter pilot

plot(x = airquality$Ozone , y = airquality$Temp ,
     pch = 19 , 
     type = "p" , 
     main = "Ozon - Temp" , 
     xlab = "Ozon" ,
     ylab = "Temperature" ,
     bty = "L" ,
     col = "red" , # Works same as histogram graphs but in this case we can color months separately
     ) 

class(airquality$Month)  # but if we want to colorize months we must change class to factor
levels(as.factor(airquality$Month))

# Colorize by groups
plot(x = airquality$Ozone , y = airquality$Temp ,
     pch = 19 , 
     type = "p" , 
     main = "Ozon - Temp" , 
     xlab = "Ozon" ,
     ylab = "Temperature" ,
     bty = "L" ,
     col = c("red" , "yellow" , "blue" , "purple" , "black")[as.factor(airquality$Month)] # If we don't do [] part it will get colorized by index
     
) 
Colors <- c("red" , "yellow" , "blue" , "purple" , "black")[as.factor(airquality$Month)] # By doing that we can use it as col = Colors

# Legend
legend(x = "topright" , levels(as.factor(airquality$Month)) ,
       col = c("red" , "yellow" , "blue" , "purple" , "black") ,
       pch = 19 
       )

# Margin - Expend - Inset
par(mar = c(5,5,4,5) , xpd = TRUE) # With mar we are giving margin values
                                   # With xpd we are expending graph by giving true we're allowing it to expend outside
                                   # Margin  values starts with bottom and moving clockwise
plot(x = airquality$Ozone , y = airquality$Temp ,
     pch = 19 , 
     type = "p" , 
     main = "Ozon - Temp" , 
     xlab = "Ozon" ,
     ylab = "Temperature" ,
     bty = "L" ,
     col = c("red" , "yellow" , "blue" , "purple" , "black")[as.factor(airquality$Month)] # If we don't do [] part it will get colorized by index
     
) 
legend(x = "topright" , levels(as.factor(airquality$Month)) ,
       col = c("red" , "yellow" , "blue" , "purple" , "black") ,
       pch = 19 ,
       inset = c(-0.2,0.2)  # With inset move our legend outside of graphic
                          # First value is for x , and second one is for y-axis. If value increase they will get closer to axis lines
       )
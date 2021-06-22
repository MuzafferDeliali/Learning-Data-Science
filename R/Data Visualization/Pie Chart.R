# Pie Char
View(mtcars)

table(mtcars$gear)
ratio <- prop.table(table(mtcars$gear)) #proportion of table

names = c("3 Gear" , "4 Gear" , "5 Gear")
t <- sprintf("%s = %s%3.1f" ,names , "%" , as.numeric(ratio)*100 )

# Explanation of sprintf %s is names
                # second %s takes "%"
                # %3.1f is ratio
                    
par(lwd = 3) # border thickness
pie(ratio ,
    main = "Gear Graph" ,
    labels = names , # Let's name it
    col = c("yellow" , "orange" , "red") , #proportion color
    clockwise = FALSE , # Should it turn in clockwise
    init.angle = 180 , # Rotation angle
    border = "black" , # Border color
    lty = 1 , # Border type
    radius = 1 # Radius size default is 0.8 ,
 
)


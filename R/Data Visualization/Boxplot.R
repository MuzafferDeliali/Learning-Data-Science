# Boxplot grap

# Bottom line is minumum top line is max and the line who divide box is median
# For further information "https://flowingdata.com/2008/02/15/how-to-read-and-use-a-box-and-whisker-plot/"

View(mtcars)

boxplot(mtcars[,c("drat" ,"wt")]) # We should pick closer valued colmn otherwise it won't be useful
boxplot(mtcars[,c("drat" ,"wt" , "qsec")]) #As you can see we can't read it properly


boxplot(mtcars[,c("drat" ,"wt")] ,
        main = "Boxplot Graph" ,
        xlab = "Variables" ,
        ylab = "Values" ,
        names = c("Drat variable" , "WT variable") ,
        col = "orange" ,
        border = "red" ,
        pch = 19 , # Outliners become filled dots
        cex.axis = 1.1 ,
        range = 0.5 , #Range adjustment and now we have more outliners
        outline = FALSE # if we value this as False outliners will be disabled
        )

# Boxplot with formula

# how gear value effects mpg

boxplot( mtcars$mpg~mtcars$gear ,
        main = "Boxplot Graph" ,
        xlab = "Gear Values" ,
        ylab = "MPG Values" ,
        col = "orange" ,
        border = "black" ,
        pch = 19 , 
        cex.axis = 1.1 ,
        outline = TRUE 
)

# Boxplot graph with 3 columns

boxplot( mtcars$mpg~mtcars$gear*mtcars$cyl , 
         main = "Boxplot Graph" ,
         xlab = "Gear Values.Cylinder Values" ,
         ylab = "MPG Values" ,
         col = "orange" ,
         border = "black" ,
         pch = 19 , 
         cex.axis = 1.1 ,
         outline = TRUE 
)
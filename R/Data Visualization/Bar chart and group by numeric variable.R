# Bar chart and group by numeric variable 

View(mtcars)
height = table(mtcars$cyl) # Finding frequency and assigning to the height

barplot(height , names.arg = c("4 Cylinder" , "6 Cylinder" , "8 Cylinder") , # Via names.arg we named our x values
        main = "Cylinder Frquency" ,
        xlab = "Cylinder Value" ,
        ylab = "Frequency" ,
        col = "pink" ,
        border = "purple" , # Border color
        horiz = TRUE , # if it's true chart will be horizontal
        cex.axis = 1.2 , # Axis number size
        cex.names = 1.1 , # Y axis name size
        axis.lty = 1 # Line type for axis 
        ) 

group_f <- function(x){
  
            quarter <- quantile(x)
            result <- character(length(x))
            
            group_1 <- which(x <= quarter[2])
            group_2 <- which(x <= quarter[3] & x > quarter[2]) # If we use < and > only if they are exact quarter it will not take their values
            group_3 <- which(x <= quarter[4] & x > quarter[3]) # This will cause empty non grouped one and some values will return as "" 
            group_4 <- which(x <= quarter[5] & x > quarter[4])
            
            result[group_1] <- "Group 1"
            result[group_2] <- "Group 2"
            result[group_3] <- "Group 3"
            result[group_4] <- "Group 4"
            
            return(result)
}

result <- group_f(mtcars$mpg) 

d <- table(result)

barplot(d , names.arg = c("Group 1" , "Group 2" , "Group 3" , "Group 4") , 
        main = "Grouped Frequancy" ,
        xlab = "Frequancy" ,
        ylab = "Groups" ,
        col = "pink" ,
        border = "purple" , 
        cex.axis = 1 , 
        cex.names = 1 , 
        axis.lty = 1
)


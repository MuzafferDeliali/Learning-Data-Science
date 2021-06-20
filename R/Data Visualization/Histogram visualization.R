View(iris)

hist(iris$Sepal.Length) # Default View

# Customized version
hist(
  iris$Sepal.Length ,
  main = "Sepal Length Histogram" ,# With main we can name our histogram 
  xlab = "Sepal Length Value" ,# with xlab we change name of x-axis 
  ylab = "Frequancy Value" ,# with ylab we change name of y-axis
  breaks = 30  ,# Break values indicate the transition between the bars in the bar graph. 
                # Which that means The higher the break value, the greater the detail of the histogram. 
  xlim = c(4,8) ,# xlim is where we give the start and end range of x
  ylim = c(0,10) ,# ylim is where we give the start and end range of y
  col = c("#40E0D0" , "#008080" , "#00CED1" , "#008080")
  ) 

# How to colorize Histogram graph ?
hist( 
  iris$Sepal.Length ,
  col = "green" # with col we change color of bars in this case we use name of color "green"
                # but we can also  hex codes or rgb for it
  )

# We can use multiple colors too
hist(
  iris$Sepal.Length ,
  breaks = 15 ,
  col = c("#3498db" , "#2ecc71" , "#9b59b6"))   # You can find color cods here -> "https://flatuicolors.com/"

# How to plot an intensity curve on a histogram plot ?

hist(iris$Sepal.Length ,
     main = "Intensity curve sample" ,
     xlab = "Values" ,
     ylab = "Density" ,
     probability = TRUE , # Frequency values will between 0-1
     col = "Orange") 

# Note every time we use "line" new line will be add

density(iris$Sepal.Length) # Let's find density
lines(density(iris$Sepal.Length)) # And lets draw the line . And lets give some parameters
lines(density(iris$Sepal.Length , adjust = 2) , # Adjust value makes the line flatter and default value is 1 
                                   col = "blue" , lwd = 2 , lty = "dotted") # Color , line thickness and line type parameters
                                              


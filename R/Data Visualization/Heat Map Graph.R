# Heat Map Graph

# we have to use matrix so it's time for class conversation

mtcars_1  <- as.matrix(mtcars)

heatmap(mtcars_1 , scale = "column" , Colv = NA , Rowv = NA) # There was big gaps between columns and now every colmn will be compared with own column
library(RColorBrewer)


heatmap(mtcars_1 , scale = "column" , Colv = NA , Rowv = NA ,
        col = colorRampPalette(brewer.pal(9 , "Blues"))(25)
        )

legend("bottomright" , legend = c("Min" , "Avg" , "Max") ,
       fill = colorRampPalette(brewer.pal(9 , "Blues"))(3))


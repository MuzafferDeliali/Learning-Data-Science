standard.d <- function(x, population = TRUE){ #as default its true but it can be change 
  
  len = length(x)
  avg = sum(x)/len #we can use mean tho
  diff = numeric(len)
    
  for( i in 1:len){
    
    diff[i] = (x[i] - avg)^2
  }
  sum_diff = sum(diff)
  
  if(population == TRUE){
    standard_avg = sum_diff/len
  }else{
    standard_avg = sum_diff/(len-1)
  }
  
  std = sqrt(standard_avg)
  return(std)
  
}
v <- c(9, 12, 34, 23, 12, 15, 16)

standard.d(v)#as you can see it show us default pop. as true
standard.d(v, population = TRUE)
standard.d(v, population = FALSE)

sd(v) #as you can se it calculates as population = false

#R programming function sd calculates sd as population false
#but if we know the population we can create our sd function like this one
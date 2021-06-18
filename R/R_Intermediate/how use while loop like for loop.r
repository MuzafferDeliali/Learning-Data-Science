View(iris)

f1 <- function(data){
  begin <- 1
  end <-nrow(data)
  
  avg <- mean(data[,3] , na.rm = T)
  
  result <- list()
  
  result[["Lower"]] <- numeric()
  result[["Bigger"]] <- numeric()
  
  while (TRUE) {
    
    if(data[begin,3] < avg){
      d = data[begin,1] * data[begin,2] / data[begin,4]
      result[["Lower"]] <- append(result[["Lower"]] , d)
                                 
    }else{
      d = data[begin,1] * data[begin,2] * data[begin,4]
      result[["Bigger"]] <- append(result[["Bigger"]] , d)
    }
    begin = begin + 1
    
    if(begin == end){
      break
    }
  }
  return(result)
}


result <- f1(iris)
class(result)
# Single Sample T-Test and Mean Confidence Interval in Big Data  

nrow(df)
 
hist(df$`math score`)
 
mean(df$`math score`)
 
t.test(df$`math score` , mu =70 ) # with 95 trust level it's between 65-67 and not equal 70


# However while working with big data taking sample and than using t-test is recommended
sample1 <- sample(df$`math score` , size = 50)
t.test(sample1 , mu = 70)

#  with 95 percent confidence interval mean is closer to 70
#    Note: depending on sample sometimes it may seem it's not close 70 but you can retest it and see the result


# For loop for taking multiple samples am

 
results <- character(50)

for(i in 1:50){
  
  sam <- sample(df$`math score` , size = 50)
  result <- t.test(sam , mu = 70)
  p <- result$p.value
  
  if(p >= 0.05) {
    results[i] <- "APPROVED"
  }else{
    results[i] <- "DECLINED"
  }
}

results 

table(results) # 27 times approved 23 declined

#Mostly H0 approved with %54 percent it's equals 70
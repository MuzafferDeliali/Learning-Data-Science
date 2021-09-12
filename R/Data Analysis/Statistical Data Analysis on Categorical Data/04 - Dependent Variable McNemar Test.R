##### McNemar Test ####

# why we use McNemar?
# if sample is dependent we will use McNemar Test
# But Fisher Fisher's Exact is independent

mcData <- data.frame(
          Before = c("Yes" , "No" , "No"  , "Yes", "No"  , "No"),
          After  = c("Yes" , "No" , "Yes" , "No" , "Yes" , "Yes")
)

table <- table(mcData)
table(mcData)

mcnemar.test(table)
# H0 : Nothing changed.
# Ha : There are differences


# H0 is accepted.
# according to p-value %61 there are no difference
#                      %39 There is at least one difference
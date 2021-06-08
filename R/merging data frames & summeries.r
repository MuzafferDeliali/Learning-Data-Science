# Merging different column names
merge_df <- merge(Demografik,Transactions ,
                  by.x = "ID", by.y = "CUSTOMER_ID")

View(merge_df)

#Renaming column
names(Transactions)
names(Transactions)[2] <- "ID"

# Merging same name colmns
merge_df2 <- merge(Demografik,Transactions,by = "ID")

View(merge_df2)

summary(iris)

View(summary(iris))
str(iris)

head(iris) #only takes first 6 row
tail(iris) #only takes last 6 row

iris[10:15, ] #takes between 10 and 15

head(iris, n = 10) #with using n we can call n sized rows

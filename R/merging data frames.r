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
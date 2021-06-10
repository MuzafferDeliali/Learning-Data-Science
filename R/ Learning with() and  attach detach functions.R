df <- singapore

View(df)
names(df)

df$id
df["id"]


attach(df)

#using attach may make things easier but if we are using multiple tables it may create a conflict 
#but if it doesnt have same variable names you can use as usual

host_id
host_name

class(host_id) #same as df$id it's "character"

detach(df) #detaches and makes objects unusable  for example "host_id" 
host_id #object not found

#NOTE: If you attach multiple times you have to detach that amount again
?with

with(mtcars, mpg[cyl == 8  &  disp > 350])
# is the same as, but nicer than
mtcars$mpg[mtcars$cyl == 8  &  mtcars$disp > 350]

#while using with we can do multiple task but it has to be inside of {} and every line is for one task
with(df, { 
        x <- mean(price, na.rm = T) 
        y <- x - 5
        print(y)
})

#with function doesn't create new session like attach does it's only allow you to use them between curly braces
#so if you try to use it like 15 and 16th lines you will get object not found error
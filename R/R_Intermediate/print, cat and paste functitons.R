x = 5
y = 10
print(x)
print(y)
print(x,y) #only prints first one

print(x);print(y)

cat(x,y) #prints both
cat(x, "+" , x, "equals", y)

t <- cat(x, "+" , x, "equals", y)
t #cat can't do assingments it will result as NULL

cat(x, "+" , x,"\n", "equals", y,"\n", "This is new line") #\n prints new line

#paste
c <- paste(x, "+" , x, "equals", y)
c #succesfully asinged but in paste functions you can't use \n

paste0(x, "+" , x, "equals", y) #it does same thing with paste but paste0 doesn't add a space between them
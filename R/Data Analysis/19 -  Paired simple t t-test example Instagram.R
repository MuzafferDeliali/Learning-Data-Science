duration <- c(IPC$RPostsDuration, IPC$LPostsDuration)

groups <- c(rep("Random" , 50), rep("Liked", 50))

df <- data.frame("duration" = duration , "groups" = groups)

View(df)

shapiro.test(df$duration[df$groups == "Random"])
shapiro.test(df$duration[df$groups == "Liked"])


bartlett.test(df$duration ~ df$groups)

t.test(df$duration ~ df$groups , mu = 0 , paired = T)
# H0 : There are no difference between them
# Ha : They are not same

# (mean of the differences ) calculations made with alphabetic order in groups

t.test(df$duration ~ df$groups , mu = 10 , paired = T , alternative = "greater")
# H0 is accepted it's equal or lower than 10

t.test(df$duration ~ df$groups , mu = 10 , paired = T , alternative = "two.sided")
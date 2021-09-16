# Min-Max Normalization Process

minMaxNorm <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
  }

minMaxNorm(df$cdur)

# Let's normalize it between 0  and 1
df$cdur <- minMaxNorm(df$cdur)
df$vdur <- minMaxNorm(df$vdur)
df$wordfreq <- minMaxNorm(df$wordfreq)

# What if we want to use as max 100 ?
df$cdur <- minMaxNorm(df$cdur)*100
df$vdur <- minMaxNorm(df$vdur)*100
df$wordfreq <- minMaxNorm(df$wordfreq)*100
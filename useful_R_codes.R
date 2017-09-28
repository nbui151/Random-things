y_func = 100*(0.85^x)
y_values = rep(NA, 24)
x_values = seq(0, 24, 1)
for(i in 1:length(x_values)){
  y_values[i] = 100*(0.85^x_values[i])
}
plot(x_values, y_values)


id = c(1, 1, 2, 2, 2, 3, 4, 5)
values = c(20, 13, 12, 14, 16, 15, 16, 17)
df = as.data.frame(cbind(id, values))

dplyr::cummean(df$values)
df$cum <- ave(df$values, df$id, FUN=cumsum)
df$avg <- ave(df$values, df$id, FUN=mean)

userid = c(2, 3, 4, 7, 8)
uservalues = c("a", "b", "c", "d", "e")
userdf = as.data.frame(cbind(userid, uservalues))

leftjoin = merge(df, userdf, by.x = "id", by.y = "userid", 
                 all.x = TRUE)

rightjoin = merge(df, userdf, by.x = "id", by.y = "userid", 
                 all.y = TRUE)

innerjoin = merge(df, userdf, by.x = "id", by.y = "userid", 
                  all = FALSE)

outerjoin = merge(df, userdf, by.x = "id", by.y = "userid", 
                  all = TRUE, sort = TRUE)



## dplyr 

df1 = dplyr::filter(df, values < 20 & id > 2)
df1 = subset(df, values < 20 & id > 2)


# set operation: 
a = c(1, 2, 3, 4)
b = c(3, 4, 5, 6)
union = union(a, b)
union
intersect = intersect(a, b)
intersect
setdiff(a, b) # items in a that are not in b, gives 1, 2 
setdiff(b, a) # items in b that are not in a, gives 5, 6 


# logical operator 
x <- c(3, 2, 4)
y <- x == 2
sum(x > 2) # sums the TRUE values 
sum(x[x > 2])# sums the actual values in x that's > 2 

x <- c(NA, 2, NA)
is.na(x) # gives TRUE when that value is NA 
mean(x, na.rm = TRUE)
mean(x[!is.na(x)])


# subsetting 
df[df$values >= 15, ]
subset(df, df$values >= 15)


# ifelse 
df$high <- ifelse(df$values > 15, "high", "low")
# create new variable df$high, if df$values
# is larger than 15, then it has value "high", else "low"

# other functions: 
var(df$values)
sd(df$values)
weighted.mean(df$values, df$id)
quantile(df$values)
IQR(df$values)

# aggregate by some group: 
tapply(df$values, df$id, mean, na.rm = T)
tapply(df$values, df$id, var, na.rm = T)

foo <- function(x){
  x = x[!is.na(x)]
  mean(x)
}


# plotting 
hist(df$values)
hist(df$values, freq = FALSE)
lines(density(df$values))
boxplot(df$values)
plot(df$id, df$values)


# two-way table 
t <- table(df$values, df$high)
prop.table(t)


# matrix calculations 
row1 <- c(2, 3, 1)
row2 <- c(4, 1, 3)
m <- matrix(c(row1, row2), ncol = 2, byrow = T)
mt <- t(m)
m %*% mt
solve() # gives the inverse of a matrix 

det(m %*% mt)

# loops 
for(i in 1:10){
  cat("i is ", i, "\n")
}

# generate container vectors 
Z <- rep(NA, 10)
for(i in 1:10){
  Z[i] <- i 
}

# create a container matrix with 10 rows and 10 columns
Z <- rep(NA, 100)
Zmat <- matrix(Z, ncol = 10, byrow = TRUE)


# sampling: 
sample(X, Y, replace = TRUE, prob = P)
# sample Y units from X with replacement with 
# probability vector P, else is equal prob 

X <- seq(1, 100, 1)
sample(X, 10, replace = TRUE)

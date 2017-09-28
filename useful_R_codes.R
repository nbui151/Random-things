# Create data frame 
id = c(1, 1, 2, 2, 2, 3, 4, 5)
values = c(20, 13, 12, 14, 16, 15, 16, 17)
df = as.data.frame(cbind(id, values))

y_func = 100*(0.85^x)
y_values = rep(NA, 24) # NA rep 
x_values = seq(0, 24, 1) # sequence 
for(i in 1:length(x_values)){
  y_values[i] = 100*(0.85^x_values[i])
}
plot(x_values, y_values)

# Date transformation 
df$date_day = as.Date(df$date, "%m/%d/%Y")
df$date_week = as.Date(cut(df$date_day,breaks = "week"))
df$date_month = as.Date(cut(df$date_day, breaks = "month"))


# Data Manipulation with dplyr 
dplyr::cummean(df$values)
df$cum <- ave(df$values, df$id, FUN=cumsum)
df$avg <- ave(df$values, df$id, FUN=mean)

df1 = dplyr::filter(df, values < 20 & id > 2)
df1 = subset(df, values < 20 & id > 2)

# cumulative sum 
library(plyr)
library(dplyr)
a$csum = cumsum(a$sum_values) # regular cumulative sum 
a <- ddply(df, .(id), transform, csum = cumsum(values)) # cumulative sum by id 

# summarize data by group 
a <- df %>% 
  group_by(id) %>% 
  summarise(sum_values = sum(values))

# Order data 
a = a[order(a$sum_values),]

# Merging and joining 
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

# Set operation: 
a = c(1, 2, 3, 4)
b = c(3, 4, 5, 6)
union = union(a, b)
intersect = intersect(a, b)
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

# function
foo <- function(x){
  x = x[!is.na(x)]
  mean(x)
}

# loops 
for(i in 1:10){
  cat("i is ", i, "\n")
}

# While loop 
v <- c("Hello. while loop")
count <- 2 
while (count < 7){
  print(v)
  count = count + 1
}

# generate container vectors 
Z <- rep(NA, 10)
for(i in 1:10){
  Z[i] <- i 
}


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



# create a container matrix with 10 rows and 10 columns
Z <- rep(NA, 100)
Zmat <- matrix(Z, ncol = 10, byrow = TRUE)


# sampling: 
sample(X, Y, replace = TRUE, prob = P)
# sample Y units from X with replacement with probability vector P, else is equal prob 

# select random number of rows from the dataset 
df[sample(1:nrow(df), 8, replace = T), ]


# Binomial and normal probabilities 
pbinom(q, size, prob, lower.tail = T)
# gives the probability of obtaining q or fewer successes if we have a binomial distribution with probability p 
x <- 0:10
y = pbinom(x, 10, .3, lower.tail=T)
plot(x, y, type = 'b')

pnorm(q, mean, sd, lower.tail = T)
# give the proportion of all observations we would expect to have values q or lower given that the distribution is normal
# with mean and sd as specified 
x <- seq(-3, 3, 0.1)
y <- pnorm(x, 0, 1, lower.tail = T)
plot(x, y, type = 'l') # basically gives the CDF 

# draw randomly from a distribution 
rbinom(n, s, p) # takes a random draw from a binomial with size s and prob p

# draw from the normal 
rnorm(n, mean, sd)
rnorm(10, 0, 1)

# probability density function 
# equals the likelihood of observing a certain value of x
dbinom(5, 10, 0.5)
dnorm(1, 0, 1)

# normal distribution 
qnorm(p, mean sd) # returns the 100*pth percentile of the normal 
qnorm(.975, 0, 1) # gives 1.96 
# Basically means 97.5% of the data is below 1.96 

# Regression models
fit <- lm(y ~ x, data = data)
fit <- lm(y ~ x + factor(x2) - 1, data = data) # varying fixed intercepts 
fit <- glm(y ~ x, family = "binomial", data = data) # logistic regression
fit <- lmer(y ~ x + (1 | factor(group))) # varying intercepts (random)
fit <- lmer(y ~ x + (1 + x | factor(group))) # random intercepts and slopes 


# Heteroskedasticity consistent sandwich estimators 
library("sandwich")
library("lmtest")
x <- sin(1:100)
y <- 1 + x + rnorm(100)
fm <- lm(y ~ x)
summary(fm)
coeftest(fm, vcovHC)

# Plotting 
# plotting 
hist(df$values)
hist(df$values, freq = FALSE)
lines(density(df$values))
boxplot(df$values)
plot(df$id, df$values)
library("ggplot2")
ggplot(data = data, aes(x, y)) + geom_point() # points 
ggplot(data = data, aes(x, y)) + geom_line() # lines 
ggplot(data = df, aes(id, values)) + geom_col() # bars 
coplot(y ~ year|country, type="b", data=Panel) # have a bigger plot by group (country) 
library("gplot")
plotmeans(y ~ country, main="Title", data=Panel)

# running new script
v1 <- c(1, -5, 3, -7, 12, -9)
v2 <- c(30, 50, 10)

# Exercise A.1
v1 + 10

# Exercise A.2
v1 * 10

# Exercise A.3
v2 + v1

# ----- Exercises B ---------

# Exercise B.1
x <- v1[c(2,5)]
x

# Exercise B.2
y <- v1[-c(2,5)]
y

# Exercise B.3
ww <- v1>=3
ww

# Exercise B.4
v12 <- c(v1,v2)
v12

# Exercise B.5
v123 <- any(v12 > 2 & v12 < 4)
v123

# Exercise B.6 -version 1
negative_v12 <- v12[v12 < 0]
length(negative_v12)

# Exercise B.6 -version 2
negative_v12_bo <- v12 < 0
negative_count <- sum(negative_v12_bo)
print(negative_count)

# Exercise B.7 Generate the vector g which contains first 3 times the character value 'weak' followed by 2 times the
# character value 'strong'. Hint: Use the rep() function!
weak <- rep('weak', 3)
strong <- rep('strong', 2)
combined <- c(weak, strong)
print(combined)

# --------- starting C exercises ------------

set.seed(1234)
x <- round(runif(100,0,10))
y <- round(runif(100,0,10))

# Exercise C.1) Find the smallest element in x
xMin <- min(x, na.rm = FALSE)

# Exercise C.2) Find the largest element in x
xMax <- max(x, na.rm  = FALSE)

# Exercise C.3) Find the range of x
xRange <- range(x)

# Exercise C.4) Find the sum of all the elements in x
xSum <- sum(x, na.rm = FALSE)

# Exercise C.5) Find the mean of all the elements in x. (Does it seem reasonable?)
xMean <- mean(x)

xMeanRound <- round(mean(x))

# Exercise C.6) Find the standard deviation of all the elements in x. (Does it seem reasonable?)
xStdDev <- sd(x, na.rm = FALSE)

# Exercise C.7) Make a vector from x where the elements no. 11 − 20 And element no. 51 are removed. Hint: Use 
# indices with negative sign.
xSubset <- x[c(0:10, 21:50, 52:100)]

xSubset2 <- x[-c(11:20, 51)]

# Exercise C.8) Make a vector from x where all the elements with value less than 5 are removed.
xRm5 <- x[x>5]

# Exercise C.9) Determine the index of those elements in x which have value either 0 or 10.
xIs0or10 <- which(x %in% c(0,10))

# Exercise C.10) Determine the index of those elements in x which have the same value as the preceding one. Hint: use
# the command diff().
xDiff <- diff(x, lag = 1, difference = 1)
xIndex <- which(xDiff %in% c(0))+1

# Exercise C.11) Consider x and y as paired observations. Make a vector of those elements of x for which y takes the
# value 5.
yObs <- which(y %in% c(5))
pairedObservations <- x[c(yObs)]

# Exercise C.12) Determine the indices for which x and y have the same value.
sameValuesXandY <- which(x == y)

# Exercise Make a vector which from every pair of x and y chooses the largest of the two values. Hint: use the
# command ifelse().
largestXorY <- ifelse(x < y, y, x)

# Exercise C.14) Solve the exercise above even more easily with the command pmax()
largestXorYv2 <- pmax(x, y)

# Exercise 





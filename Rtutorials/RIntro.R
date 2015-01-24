
## ------------------------------------------------------------------------
ls()


## ------------------------------------------------------------------------
# this is a comment, R will not run this


## ------------------------------------------------------------------------
2+2  # what is 2+2?


## ------------------------------------------------------------------------
3*2   # multiplication
10/5  # division
10-4  # subtraction 
3^2   # power


## ------------------------------------------------------------------------
x <- 1:10


## ------------------------------------------------------------------------
x


## ------------------------------------------------------------------------
View(x)


## ------------------------------------------------------------------------
y <- seq(from = 1, to = 10, by = 1)  # assign the sequence 1 to 10 to vector y
x   # display x
y   # display y


## ------------------------------------------------------------------------
y1 <- seq(from=0, to=5, length=20)


## ------------------------------------------------------------------------
y1


## ------------------------------------------------------------------------
sqrt(16) # computes square root of 16
log(10)  # computes natural log of 10
exp(2)   # computes e^2
cos(2)   # computes cosine of 2


## ------------------------------------------------------------------------
z <- x^2 + 2
z


## ------------------------------------------------------------------------
plot(x,z)


## ------------------------------------------------------------------------
plot(x,z, type="l",  col="red", xlab="Variable x", ylab="Variable z", main="Example Plot")


## ------------------------------------------------------------------------
names <- c("Angelo", "Brian", "Sandy", "Jenny", "John", "Carl")
names  # show the vector of names


## ------------------------------------------------------------------------
ls()


## ------------------------------------------------------------------------
rm(x)  # remove x from memory
ls()   # show variables in memory


## ------------------------------------------------------------------------
x<- c(2, 3.1, 5.2, 3.8)  # creates vector x with 4 numeric elements
x                        # shows x
x[2]                     # shows element 2 of x
x[2:4]                   # shows elements 2, 3 and 4 of x
length(x)                # length of vector x


## ------------------------------------------------------------------------
y<-c(1,2,3,4)    # create vector y
M<- cbind(x,y)   # create matrix M, by attaching x and y (column)
y
M     # show matrix M
M[3,2] # shows element at row 3 and column 2 of matrix M
M[1:3,] # shows elements in rows 1 to 3, and all colums of matrix M
M[,1]   # shows only column 1 of matrix M


## ------------------------------------------------------------------------
N <- matrix(c(x,y), nrow=4) # creates matrix N with 4 rows, using the 
                            # vectors x and y as inputs
N     # notice that N is equivalent to M


## ------------------------------------------------------------------------
P <- rbind(x,y)   # creates matrix P, attaching x and y (row)
P


## ------------------------------------------------------------------------
dim(M)   # 4 rows and 2 columns


## ------------------------------------------------------------------------
FF <- (2+2 == 5)


## ------------------------------------------------------------------------
FF


## ------------------------------------------------------------------------
TT <- (2 + 2 > 3) # 2+2>3 is TRUE
FF2<- (20<10)     # 20<10 is a FALSE statement
TT2<- ("Angelo" != "Angela")  # the symbol != means "different" (so this is TRUE)


## ------------------------------------------------------------------------
a<- c(10, 2, 3, 13)
b<- c(11,4,1,12)
check <- (a>b) # is the entry of a  greater than the same entry of b?
check
cbind(a,b,check)


## ------------------------------------------------------------------------
rep(0,times=10) # generates a vector of zero, repeated 10 times
rep(1:4,times=2) # generetes a vector that repeats the seqence 1:4 for 2 times


## ------------------------------------------------------------------------
t(M)  # transpose of matrix M
2*M   # multiplies each entry of matrix M by 2


## ----echo=FALSE, results=TRUE--------------------------------------------
print(1)
print(2)
print(3)
print(4)
print(5)


## ------------------------------------------------------------------------
for (i in 1:5) print(i)


## ------------------------------------------------------------------------
x <- 0
for (i in 1:10) {
  print(i)
  x <- x + i
  print(paste("x =", x))
}


## ------------------------------------------------------------------------
people <- c("John", "Vanessa", "Carly")
for (i in people) {
  print(i)
}


## ------------------------------------------------------------------------
d<- seq(from=1, to=25, by=1)
D <- matrix(d,nrow=5)


## ------------------------------------------------------------------------
sumD <- 0  # initialize the sum to zero
for (i in 1:5) {  # i indicates the row
  for (j in 1:5) {  # j indicates the column
    sumD = sumD + D[i,j] 
  }
}


## ------------------------------------------------------------------------
sumD


## ------------------------------------------------------------------------
sum(D)


## ------------------------------------------------------------------------
mysum <- function(a,b) {
  x <- a + b
  return(x)
}


## ------------------------------------------------------------------------
mysum(3,4) # gives 7
mysum(4,10) # returns 14


## ------------------------------------------------------------------------
library()   # see all packages installed 
search()    # see packages currently loaded


## ----echo=FALSE, results=TRUE--------------------------------------------
# create a data frame from scratch 
age <- c(25, 30, 56)                   # create vector with ages
gender <- c("male", "female", "male")  # create vector with gender
weight <- c(160, 110, 220)             # create vector with weight
mydata <- data.frame(age,gender,weight)# create data frame containing the 3 variables
mydata                                 # shows data frame


## ------------------------------------------------------------------------
mydata$age # shows the variable age in data.frame mydata


## ------------------------------------------------------------------------
mydata[,1] # shows column 1 of mydata, i.e the variable age


## ------------------------------------------------------------------------
setwd("C:/Users/amele1/Dropbox/NetOrgJHU/GMBA_spring2014/")
mydata <- read.table("mydata.csv", header=TRUE, sep=",")
#mydata <- read.csv("mydata.csv", header=TRUE, sep=",")


## ------------------------------------------------------------------------
mydata


## ----echo=FALSE----------------------------------------------------------
library(gdata)                                # loads package gdata
mydata<-read.xls("mydata.xls", 
                 perl="C:/strawberry/perl/bin/perl") # loads data into memory


## ------------------------------------------------------------------------
mydata


## ----echo=FALSE----------------------------------------------------------
mydata<-read.xls("mydata.xlsx", 
                 perl="C:/strawberry/perl/bin/perl") # loads data into memory


## ------------------------------------------------------------------------
rm(list=ls()) # clears memory
data(trees)   # load dataset trees into memory
head(trees)   # show first few rows of the data


## ------------------------------------------------------------------------
summary(trees)


## ------------------------------------------------------------------------
summary(trees$Height)


## ------------------------------------------------------------------------
attach(trees) # will create one variable for each column  of the data.frame


## ------------------------------------------------------------------------
summary(Height)


## ------------------------------------------------------------------------
hist(Height)


## ------------------------------------------------------------------------
hist(Height, col="blue", main="Height of Tree", xlab="Height" )


## ------------------------------------------------------------------------
pairs(trees)
pairs(trees, pch=19, cex=0.5, col="red")


## ------------------------------------------------------------------------
cor(trees)  # computes correlation for all the variables in the data
cor(cbind(Girth, Height, Volume)) # computes correlation for all the variables
cor(Girth, Height) # computes correlation between girth and height


## ------------------------------------------------------------------------
model1 <- lm(formula = Girth ~ Volume)


## ------------------------------------------------------------------------
model1


## ------------------------------------------------------------------------
summary(model1)


## ------------------------------------------------------------------------
plot(Volume, Girth, pch=19, col="red", xlim=c(0,100), ylim=c(0,30))
abline(model1)



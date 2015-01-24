
## @knitr eval=FALSE
## ergm (formula, estimate="MPLE")


## @knitr eval=FALSE
## ergm (formula, estimate="MLE")


## @knitr statnet, message=FALSE, warning=FALSE
# load the library
library(statnet)


## @knitr 
# load data of florentine families
data(florentine)


## @knitr marriage, echo=TRUE, results=FALSE
# network of marriages
flomarriage


## @knitr business, echo=TRUE, results=FALSE
# network of business relationships
flobusiness


## @knitr formula1
f1 <- flomarriage ~ edges + nodecov("wealth")


## @knitr estmodel1
# estimate logistic regression model
model1<-ergm(f1, estimate="MPLE" )


## @knitr model1
# show results of logistic regression model
summary(model1)


## @knitr , echo=FALSE
p<- exp(-2.59)/(1+ exp(-2.59) )


## @knitr , echo=FALSE
p2<- exp(-2.59+0.01*12)/(1+ exp(-2.59+0.01*12) )


## @knitr 
f2 <- flomarriage ~ edges + absdiff("wealth")


## @knitr 
# estimate logistic regression model
model2<-ergm(f2, estimate="MPLE")


## @knitr model2
# show results of logistic regression model
summary(model2)


## @knitr 
f3 <- flomarriage ~ edges + absdiff("wealth", pow=2)


## @knitr 
# estimate logistic regression model
model3<-ergm(f3, estimate="MPLE")


## @knitr model3
# show results of logistic regression model
summary(model3)


## @knitr 
f4 <- flomarriage ~ edges + nodecov("wealth") + absdiff("wealth")


## @knitr 
# estimate logistic regression model
model4<-ergm(f4, estimate="MPLE")


## @knitr model4
# show results of logistic regression model
summary(model4)


## @knitr 
f5 <- flomarriage ~ edges + nodecov("wealth") + absdiff("wealth")+ nodecov("priorates") + absdiff("priorates")


## @knitr 
# estimate and show logistic regression model
model5<-ergm(f5, estimate="MPLE")
summary(model5)


## @knitr 
data(fauxhigh)
fauxhigh


## @knitr 
summary(fauxhigh)


## @knitr 
table(get.vertex.attribute(fauxhigh, "Race"))
table(get.vertex.attribute(fauxhigh, "Grade"))
table(get.vertex.attribute(fauxhigh, "Sex"))


## @knitr 
f6 <- fauxhigh ~ edges + nodematch("Sex")


## @knitr 
model6 <- ergm(f6, estimate="MPLE")
summary(model6)


## @knitr 
f7 <- fauxhigh ~ edges + nodematch("Race")


## @knitr 
model7 <- ergm(f7, estimate="MPLE")
summary(model7)


## @knitr 
f8 <- fauxhigh ~ edges + nodematch("Race", diff=TRUE)


## @knitr 
model8 <- ergm(f8, estimate="MPLE")
summary(model8)


## @knitr 
mixingmatrix(fauxhigh, "Race")


## @knitr 
f9 <- fauxhigh ~ edges + nodematch("Race", diff=TRUE, keep=c(2,3,5))


## @knitr 
model9 <- ergm(f9, estimate="MPLE")
summary(model9)


## @knitr 
f9 <- fauxhigh ~ edges + nodematch("Race", diff=TRUE, keep=c(2,3))


## @knitr 
f10 <- fauxhigh ~ edges + nodematch("Grade", diff=TRUE)
model10<-ergm(f10, estimate="MPLE")
summary(model10)


## @knitr 
mixingmatrix(fauxhigh, "Grade")


## @knitr 
f11<- fauxhigh ~ edges + nodefactor("Sex")
model11<- ergm(f11, estimate="MPLE")
summary(model11)



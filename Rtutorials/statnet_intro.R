
## @knitr , install, eval=FALSE
## install.packages("statnet", dependencies=TRUE, repos="http://lib.stat.cmu.edu/R/CRAN/")
## install.packages("ergm.count", dependencies=TRUE, repos="http://lib.stat.cmu.edu/R/CRAN/")
## install.packages("latticeExtra", dependencies=TRUE, repos="http://lib.stat.cmu.edu/R/CRAN/")


## @knitr statnet, message=FALSE, warning=FALSE
# load the library
library(statnet)


## @knitr dataergm
# check data in the package
data(package="ergm")


## @knitr 
# load data of florentine families
data(florentine)


## @knitr marriage, echo=TRUE, results=FALSE
# network of marriages
flomarriage


## @knitr business, echo=TRUE, results=FALSE
# network of business relationships
flobusiness


## @knitr 
# plot network of marriages
set.seed(1977)
plot(flomarriage, displaylabels=TRUE )


## @knitr 
# plot network of business
set.seed(1977)
plot(flobusiness, displaylabels=TRUE )


## @knitr estmodel1
# estimate logistic regression model
model1<-ergm(flomarriage~edges +nodecov("wealth"), estimate="MPLE" )


## @knitr model1
# show results of logistic regression model
summary(model1)


## @knitr , echo=FALSE
p<- exp(-2.59)/(1+ exp(-2.59) )


## @knitr , echo=FALSE
p2<- exp(-2.59+0.01*12)/(1+ exp(-2.59+0.01*12) )


## @knitr 
# estimate logistic regression model
model2<-ergm(flomarriage~edges + absdiff("wealth"), estimate="MPLE")


## @knitr model2
# show results of logistic regression model
summary(model2)


## @knitr , results='asis', message=FALSE, echo=F, warning=FALSE, tidy=TRUE
library(texreg)
htmlreg(list(model1,model2), doctype = F, html.tag = F, inline.css = T, 
    head.tag = F, body.tag = F, center = T, single.row = F, caption = "",
        custom.coef.names=c("$$constant$$", "$$wealth_i + wealth_j$$", "$$|wealth_i - wealth_j|$$"))


## @knitr triergmmple
# estimate logistic regression model
model3<-ergm(flomarriage ~ edges + absdiff("wealth") + triangles, estimate="MPLE")


## @knitr 
# show results of logistic regression model
summary(model3)


## @knitr triergmmcmc
# estimate ergm model with simulation method
set.seed(0)
model4<-ergm(flomarriage ~ edges + absdiff("wealth") + triangles, estimate="MLE",
             control=control.ergm(MCMC.samplesize=10000) )


## @knitr 
# show results of ergm model
summary(model4)


## @knitr 
# run diagnostics for ergm model
mcmc.diagnostics(model4)



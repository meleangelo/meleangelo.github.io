
## ------------------------------------------------------------------------
## clear memory 
rm(list=ls())


## ------------------------------------------------------------------------
## set working directory to your directory
setwd("C:/Users/amele1/Dropbox/NetOrgJHU/GMBA_spring2014/Rtutorials")


## ------------------------------------------------------------------------
## load the igraph package
library(igraph) 


## ------------------------------------------------------------------------
#### Marriage in Renaissance Florence ####
florence <- read.table("firenze.txt")


## ------------------------------------------------------------------------
florence <- as.matrix(florence)


## ------------------------------------------------------------------------
### check what is contained in the matrix florence
florence


## ------------------------------------------------------------------------
## create the graph object
marriage <- graph.edgelist(florence, directed=FALSE)


## ------------------------------------------------------------------------
## check the graph object
marriage


## ------------------------------------------------------------------------
ecount(marriage) # count all the edges
vcount(marriage) # count all the vertices/nodes
V(marriage)      # shows the list of vertices/nodes
E(marriage)      # shows the list of edges/links


## ------------------------------------------------------------------------
## plot it
plot(marriage)


## ------------------------------------------------------------------------
## set some color atributes (V() gives back the 'vertices' = nodes)
V(marriage)$color = "pink"        # color of the nodes
V(marriage)$frame.color = "green" # color of the node frame
V(marriage)$label.color = "red"   # color of the node labels (the family names)

## plot it
plot(marriage)


## ------------------------------------------------------------------------
## set some color atributes (E() gives back the 'edges')
E(marriage)$width <- 2        # width of edges (makes it ticker, default is 1)
E(marriage)$color <- "blue"   # color of the edges

## plot it
plot(marriage)


## ------------------------------------------------------------------------
# computes the degree of each family
deg<-degree(marriage)
deg


## ------------------------------------------------------------------------
## print the degree for each family
sort(deg)                  #from lowest to highest
sort(deg, decreasing=TRUE) #from highest to lowest


## ------------------------------------------------------------------------
# compute the degree distribution
deg.dist <- degree.distribution(marriage)
deg.dist


## ------------------------------------------------------------------------
# i want both plots in the same figure, so i set a parameter
# par(mfrow=c(1,2)) the command tells R to generate a figure that
# contains space for 2 graphs (in 1 row)
par(mfrow=c(1,2)) 
hist(deg, freq=FALSE, breaks=10, xlim=c(0,8), 
     col="blue", main="Degree distribution (histogram)",
     xlab="Degree")
stripchart(deg,method="stack",at=0, xlim=c(0,10),
           pch=19, col="blue", main="Degree distribution (dot chart)",
           xlab="Degree")


## ------------------------------------------------------------------------
## calculate shortest paths
## shortest path between Peruzzi and Acciaiuoli
PtoA <- get.shortest.paths(marriage, from="Peruzzi", to="Acciaiuoli")
## shortest path between Ginori and Strozzi
GtoS <- get.shortest.paths(marriage, from="Ginori", to="Strozzi")


## ------------------------------------------------------------------------
## all the shortest paths between Medici and Bischeri
MtoB <- get.all.shortest.paths(marriage, from="Medici", to="Bischeri")


## ------------------------------------------------------------------------
# list of results 
MtoB


## ------------------------------------------------------------------------
# first element of the list: a vector with the indices of families in the 
# 1st shortest path between Medici and Bischeri
MtoB$res[[1]]


## ------------------------------------------------------------------------
# show names of families in 2nd shortest path from Medici to Bischeri 
V(marriage)[MtoB$res[[1]]]


## ------------------------------------------------------------------------
# show names of families in 2nd shortest path from Medici to Bischeri 
V(marriage)[MtoB$res[[2]]]


## ------------------------------------------------------------------------
# list of vertices from Peruzzi (family 10) and Acciaiuoli (family 8)
PtoA


## ------------------------------------------------------------------------
# show names of families in path from Peruzzi to Acciaiuoli
V(marriage)[PtoA[[1]]]


## ------------------------------------------------------------------------
GtoS[[1]]


## ------------------------------------------------------------------------
## all the shortest paths between Medici and Bischeri
MtoB <- get.all.shortest.paths(marriage, from=9, to=6)
MtoB


## ------------------------------------------------------------------------
## set fat edges and default grey (E() returns edges)
E(marriage)$width <- 2
E(marriage)$color <- "grey"
E(marriage, path=PtoA[[1]])$color <- "green"
E(marriage, path=GtoS[[1]])$color <- "blue"
plot(marriage)


## ------------------------------------------------------------------------
## show all the shortest paths between Medici and Bischeri
E(marriage)$width <- 2          # set width of the edge to 2
E(marriage)$color <- "grey"     # sets edge color to grey
E(marriage, path=MtoB$res[[1]])$color <- "green"  # Medici=Bischeri path 1 is green
# When we draw a graph, the layout is determined by an
# algorithm, which is initialized at a random number.
# if you want all the graph to look the same, you need to set
# the seed of the random number to be the same for all graphs
# here we use 7777 but you may change the nummer
set.seed(7777)                  # sets seed for random number generator
plot(marriage)                  # plot the network


## ------------------------------------------------------------------------
# the 2nd path from Medici to Bischeri is blue
E(marriage)$color <- "grey"      # re-sets edge color to grey
E(marriage, path=MtoB$res[[2]])$color <- "blue" # Medici=Bischeri path 2 is blue
set.seed(7777)                  # sets seed for random number generator
plot(marriage)                  # plot the network


## ------------------------------------------------------------------------
# the 3rd path from Medici to Bischeri is purple
E(marriage)$color <- "grey"      # re-sets edge color to grey    
E(marriage, path=MtoB$res[[3]])$color <- "purple" # Medici=Bischeri path 3 is purple
set.seed(7777)                  # sets seed for random number generator
plot(marriage)                  # plot the network


## ------------------------------------------------------------------------
## compute the length of shortest paths among all pairs of families
shortest.paths(marriage)


## ------------------------------------------------------------------------
## compute the length of shortest paths among all pairs of families
spl<-shortest.paths(marriage)
## save the resulting table into a .csv file
write.csv(spl, "spl.csv")


## ------------------------------------------------------------------------
# how many nodes in the network?
n <- length(V(marriage))
# degree centrality = degree/(n-1)
deg.cent <-  deg/(n-1)


## ------------------------------------------------------------------------
## compute the betweenness for each family
bet<-betweenness(marriage)


## ------------------------------------------------------------------------
## compute the betweenness centrality index for each family
bet.cent<-bet/(n*(n-1)/2)


## ------------------------------------------------------------------------
close.cent <- closeness(marriage)


## ------------------------------------------------------------------------
# compute eigenvector centrality
eig.cent <- evcent(marriage, directed=FALSE)$vector


## ------------------------------------------------------------------------
# compute page rank
pr.cent <- page.rank(marriage, directed=FALSE)$vector


## ------------------------------------------------------------------------
round(pr.cent, 2)


## ------------------------------------------------------------------------
## clustering coefficient for each family
clust <- transitivity(marriage, type="local")


## ------------------------------------------------------------------------
indices <- data.frame(clust, deg.cent, bet.cent, close.cent, eig.cent, pr.cent)
indices


## ------------------------------------------------------------------------
# plot eigenvector vs betweeness centrality
plot(eig.cent, bet.cent, xlim=c(0,1), ylim=c(0,1)) 
# plot all pair of indices
pairs(indices, xlim=c(0,1), ylim=c(0,1))
# compute correlations among indices
cor(indices)


## ------------------------------------------------------------------------
## compute constraint (structural hole)
constr <- constraint(marriage)
constr


## ----datacreation, echo=FALSE--------------------------------------------
at <- read.table("nodal.attr.txt", header=TRUE)
att<-at[,1:2]
write.table(att, file="attr.txt", row.names=FALSE)
attr <- read.table("attr.txt", header=TRUE)
#head(attr)
#tail(attr)
rm(at,att,attr)


## ------------------------------------------------------------------------
# load list of edges in memory
el <- read.table("edgelist.txt")
# load individual attributes in memory
attr <- read.table("attr.txt", header=TRUE)


## ------------------------------------------------------------------------
g <- graph.edgelist(as.matrix(el), directed=FALSE)
g


## ------------------------------------------------------------------------
V(g)$sex <- attr$sex 


## ------------------------------------------------------------------------
g


## ------------------------------------------------------------------------
V(g)$race <-attr$race


## ------------------------------------------------------------------------
g


## ------------------------------------------------------------------------
par(mfrow=c(1,1))
vcol <- rep("red", 256)
vcol[attr$sex == 1] <- "blue"
V(g)$color <- vcol


## ------------------------------------------------------------------------
plot(g, vertex.size=7, vertex.label.color="white", vertex.label.cex=0.6, edge.width= 2, edge.color = "black" )


## ------------------------------------------------------------------------
png("Figure1.png")    # choses the file to save the picture
plot(g, vertex.size=7, vertex.label.color="white", vertex.label.cex=0.6, edge.width= 2, edge.color = "black" )   # produces the figure
dev.off()   # closes the file 


## ------------------------------------------------------------------------
pdf("Figure1.pdf")    # choses the file to save the picture
plot(g, vertex.size=7, vertex.label.color="white", vertex.label.cex=0.6, edge.width= 2, edge.color = "black" )   # produces the figure
dev.off()   # closes the file 


## ------------------------------------------------------------------------
par(mfrow=c(1,1))
vcol <- rep("green", 256)
vcol[attr$race == 2] <- "orange"
V(g)$color <- vcol
plot(g, vertex.size=7, vertex.label.color="white", vertex.label.cex=0.6, edge.width= 2, edge.color = "black" )   # produces the figure


## ------------------------------------------------------------------------
par(mfrow=c(1,1))
vshape <- rep("circle", 256)
vshape[attr$sex == 1] <- "square"
plot(g, vertex.size=7, vertex.label.color="black", vertex.label.cex=0.6, edge.width= 2, edge.color = "black", vertex.shape=vshape )   # produces the figure



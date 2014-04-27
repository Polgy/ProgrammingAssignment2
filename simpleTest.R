set.seed(1713)
#M <- matrix(rnorm(100),10, 10)
M <- matrix(runif(10e6),nrow=1000, ncol=1000)
M <- M%*% t(M)
dim(M)
XObj <- makeCacheMatrix (M)
#XObj$set(M)
system.time(I1<-cacheSolve(XObj))
# second run
system.time(I2<-cacheSolve(XObj))


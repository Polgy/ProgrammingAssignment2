## makeCacheMatrix is the function that returns a closure
## that has methods initialize and retrieve matrix as wels as
## to set and return an attribute that is an inverse of the matrix

## Example: lets generate positive semi-definite random matrix:
 # M <- matrix(rnorm(100),10, 10)
 # M <- M %*% t(M)
 

##

## makeCacheMatrix is an object constructor, that initializes object with set 
 # and return methods 

makeCacheMatrix <- function(X = matrix()) {
  myInverse<-NULL
  
  get <- function() X
  #### get will return 
  
  set <- function(Y) {
    #### set will set matrix in the defining environemnt
    #### and will reset inverse to NULL in the parent env
    X<<-Y
    myInverse <<- NULL
  }
  
  #### 'methods' for working with our "object"
  setInv<- function(XInv) myInverse <<- XInv
  
  getInv <- function() myInverse
  
  #return list
  list(get = get, set = set, getInv = getInv, setInv = setInv)

}


## cacheSolve returnsm inverse of the matrix 
 # it can also cache a particular solution if additional parameters are passed
 # to solve() via ...

cacheSolve <- function(x, ...) {
  #### Returns a matrix that is the inverse of 'x'
  #### WE rely on this method to work correctly with our closure.
  #### this approach is set up by the framework of this assignment. It differs
  #### from object oriented paradigm in that this method is not encapsulated.
  INV <- x$getInv()
  
  if (!is.null(INV)) {
    message("returning cached data")
    return(INV)
  }
  
  MX <- x$get()
  INV <- solve(MX, ...)
  x$setInv(INV)
  #returned inverted matrix
  INV
}


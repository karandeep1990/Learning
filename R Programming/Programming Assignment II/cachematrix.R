## The methods below store the matrix and the 
## calculated inverse in the cache. When asked
## to compute the inverse for the matrix, it returns the 
## cached inverse if the matrix is the same. Else it 
## calculates the new inverse and stores it.

## This functions holds the values and setters and 
## getters functions for the matrix and the inverse.
## *Note, everytime you the set functions is called,
## it sets the matrix, inverse becomes null

makeCacheMatrix <- function(m = matrix()) {
  i <- NULL
  set <- function(y) {
    m <<- y
    i <<- NULL
  }
  get <- function() {
    m
  }
  setinverse <- function(inverse) {
    i <<- inverse
  }
  getinverse <- function() {
    i
  }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the matrix
## held in the makeCacheMatrix().
## If the inverse has already been calculated
## it will be returned, else it will be calculated. 
## *Note, if the matrix changes using "set" method, 
## the inverse is set to NULL (see makeCacheMatrix)

cacheSolve <- function(x) {
  i <- x$getinverse()
  if(!is.null(i) ) {
    message("getting cached data")
    return(i)
  }
  m <- x$get()
  i <- solve(m)
  x$setinverse(i)
  i
}
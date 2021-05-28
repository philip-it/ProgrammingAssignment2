## makeCacheMatrix function computes and caches the inverse of the matrix 
## it stores.
## cacheSolve retrieves or computes the the supplied matrix's inverse

## Function to store a matrix and the cached value of its inverse after
## calculting it
  
makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  
  #stores the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  #returns the matrix
  get <- function() {
    x
  }
  
  #caches the inverse
  setinverse <- function(solve) {
    i <<- solve
  }
  
  #returns the inverse
  getinverse <- function() {
    i
  }
  
  #returns a list of functions
  list(set = set, get = get,
       setinverse = setinverse, getinverse = setinverse)
}

## Function that computes the matrix's inverse or retrieves its cached value 
## value depending on its availability.

cacheSolve <- function(x, ...) {
  
  #retrieves the cached value if it exists
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  #gets the matrix otherwise, finds inverse, caches it
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  
  #returns the inverse
  i
}

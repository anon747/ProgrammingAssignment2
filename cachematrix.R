## makeCacheMatrix: allows one to set/get a matrix and set/get its inverse
## cacheSolve: calculates inverse of matrix created using makeCacheMatrix, if not already calculated and stored in cache

## makeCacheMatrix: allows one to set/get a matrix and set/get its inverse

makeCacheMatrix <- function(x = matrix()) {
  #initialize inverse to NULL
  inverse <- NULL 
  
  #set value of matrix
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  
  #get value of matrix
  get <- function() x
  
  #set inverse of matrix
  setinverse <- function(solve) inverse <<-solve
  
  #get inverse of matrix
  getinverse <- function() inverse
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## cacheSolve: calculates inverse of matrix created using makeCacheMatrix, if not already calculated and stored in cache

cacheSolve <- function(x, ...) {
  #get inverse from the matrix created using makeCacheMatrix function
  inverse <- x$getinverse()
  
  #if inverse is already calculated
  if(!is.null(inverse)){
    message("getting inverse from cache")
    return (inverse)
  }
  
  #if inverse is not already calculated
  inverse <- solve(x, ...)
  x$setinverse(m)
  inverse
}

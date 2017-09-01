## Below function will create cache of inverse matrix. This will be used
## when repititive measurement for same inverse matrix happens.Instead of
## doing same calculation will take it from cache
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
 #initialize
  m <<-NULL
  # set base matrix 
  set <- function(y) {
    sMatrix <<- y
    m <<-NULL
  }
  # return base matrix
  get <- function() sMatrix
  # setter and getter for inverse matrix
  setInvMatrix <- function(mInv) m<<-mInv
  getInvMatrix <- function() m
  list(set = set, get = get,
       setInvMatrix=setInvMatrix,
       getInvMatrix=getInvMatrix
       )
}


## This will used makeCacheMatrix function to get the inverse cache(When
## matrix has not changed).if not will create cache Matrix 
## 
cacheSolve <- function(x, ...) {
 ## Return a matrix that is the inverse of 'x'
 # get inverse Cache matrix
  m <- x$getInvMatrix()
  #  print(m)
  # Check if condition is true
 if(!is.null(m)) 
     {
    message("getting cached data")
    return(m)
  }
  # if condition failed create cache data
   message("creating cached data")
   matrixData <-x$get()
  #   print(matrixData)
   m <- solve(matrixData,...)
  #   print(m)
   x$setInvMatrix(m)
   m
}
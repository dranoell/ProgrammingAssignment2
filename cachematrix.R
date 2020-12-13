## Put comments here that give an overall description of what your
## functions do

#These functions create an object which stores matrix and inverts it

makeCacheMatrix <- function(x = matrix()){
  i <- NULL #initialize inverse property as NULL
  set <- function(z){ #set matrix
    x <<- z
    i <<- NULL
  }
  get <- function(){
    x #get matrix
  } 
  setinverse <- function(inverse) { #set inverse of matrix x
    i <<- inverse
  }
  
  getinverse <-function() { 
    i
  }
  
  list(set = set, 
       get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}

cacheSolve <-function(x, ...){ #gets info from cache
  i <- x$getinverse()
  if(!is.null(i)){ #checks whether inverse is null
    message("getting cached data")
    return(i) #returns inverse
  }
  matrix <- x$get() #get matrix
  i <- solve(matrix, ...) #calculate inverse
  x$setinverse(i) #set inverse
  i #return matrix
}
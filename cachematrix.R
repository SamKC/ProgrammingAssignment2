<<<<<<< HEAD

## While we want to reuse the value of the inverse matrix again, recomputation may 
## be taken a long time to do agian, especially in the case of repeated 
## computation, for example, in a loop. It may be more beneficial and convenient to 
## cache the value of the inverse matrixin such a way that we can look up in the cache 
## rather than recomputed. The two functions below are expressed to cache the value 
## of the inverse matrix.


## The first function, makeCacheMatrix creates a special "Matrix", which is  
## a list containing a function to :
## 1.set the value of the matrix named "invMat"
## 2.get the value of the matrix named "invMat"
## 3.set the value of the inverse matrix
## 4.get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    invMat <- NULL
    set <- function(y) {
        x <<- y
        invMat <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) invMat <<- inverse
    getinverse <- function() invMat
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}

## The second function, cacheSolve solves and get the result of the inverse  
## of the matrix with the above function. Firstly, the function checks to see whether
## the inverse matrix is already solved. If so, then it shows the massage, gets 
## the inverse from cache and skips the computations. Otherwise it solves the inverse 
## matrix from data and and sets the value of inverse matrix in cache via the setinverse
## function.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    invMat <- x$getinverse()
    if(!is.null(invMat)) {
        message("getting cached data")
        return(invMat)
    }
    data <- x$get()
    invMat <- solve(data, ...)
    x$setinverse(invMat)
    invMat
}

## The followings are the examples of how to use these functions:
## mat_dim2 <- matrix(rnorm(10),2,2) (note: matrix has to be a square matrix)
## print(mat_dim2)
## cacheInv = makeCacheMatrix(mat_dim2)
## m$get()
## cacheSolve(cacheInv) (note: no cache yet because no data store)
## cacheSolve(cacheInv) (note: if you redo, it caches by showing the massage)

mat_dim2<-matrix(rnorm(10),2,2)
print(mat_dim2)
cacheInv = makeCacheMatrix(mat_dim2)
m$get()
cacheSolve(cacheInv)
cacheSolve(cacheInv)
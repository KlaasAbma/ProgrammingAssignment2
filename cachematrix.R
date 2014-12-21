## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x=matrix()) {
    dummy <- NULL
    get <- function() x
    setImatrix <- function(Imatrix) dummy <<- Imatrix
    getImatrix <- function() dummy
       list(get=get, setImatrix=setImatrix, getImatrix=getImatrix)
}

## Write a short comment describing this function

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x) {
    dummy <- x$getImatrix()
    if(!is.null(dummy)){
        message("Cached data found")
        return(dummy)
    }
    else {
        message("No cached data found")
        data <- x$get() # obtains matrix
        dummy <- solve(data) # finds inverse matrix
        x$setImatrix(m) # assigns resulting inverse matrix to object x
        message("Done.")
        return(dummy)
    }
}

## Put comments here that give an overall description of what your
## functions do

## Name: makeCacheMatrix
## Parameters: The matrix whose inverse is to be cached.
## Returns: A list of functions to set the matrix (named set), get the
##   matrix (get), set the inverse (setinverse) and get the inverse
##   (getinverse).
## Description: makeCacheMatrix allows us to create cache-like functionality
##   by encapsulating a matrix, its computed "inverse," and methods to get and
##   set these.

makeCacheMatrix <- function (x = matrix()) {
    inverse <- NULL

    set <- function (y) {
        x <<- y
        inverse <<- NULL
    }

    get <- function () x

    setinverse <- function (inv) inverse <<- inv

    getinverse <- function () inverse


    list(set = set, get = get, setinverse = setinverse,
         getinverse = getinverse)
}


## Name: cacheSolve
## Parameters: object returned by makeCacheMatrix; additional arguments to
##   solve (see ?solve).
## Returns: Inverse of the matrix.
## Description: Computes the inverse of a matrix.

cacheSolve <- function (x, ...) {
    inverse <- x$getinverse()

    ## If inverse is in cache, fetch from cache.
    if (!is.null(inverse)) {
        message("getting cached data")
        return (inverse)
    }

    ## If inverse is not in cache, compute inverse and store it in cache.

    mat <- x$get()

    # Create an identity matrix of appropriate size.
    I <- matrix (data = rep(0, nrow(mat) * ncol(mat)), nrow = nrow(mat),
                 ncol = ncol(mat))
    for (i in nrow(mat)) {
        I[i][i] = 1
    }

    inverse <- solve(mat, I, ...)

    x$setinverse(inverse)
    inverse
}


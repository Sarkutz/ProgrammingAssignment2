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


## Write a short comment describing this function

cacheSolve <- function (x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

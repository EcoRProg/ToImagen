#' try to read an image file
#'
#' @param newPathFile : string (path)
#'
#' @return NULL or object of class 'cimg'
#' @export
#'
#' @examples
#'
#' newPathFile <- "C:/Images"
#' loadThisImag(newPathFile)
#'
loadThisImag <- function(newPathFile){

  oldw <- getOption("warn")
  options(warn = -1)

  image01 <- NULL

  tryCatch({
    image01 <- imager::load.image(newPathFile)

  }, error = function(e) {

    message01 <- paste("Can't load this image.")

    print(message01)
  })

  options(warn = oldw)

  return(image01)

}

#' try to convert from color model to grayscale model for raster images
#'
#' @param image01 : object of class 'cimg'
#' @param nameFileImag : string (file name)
#'
#' @return object grayscale image (spectrum == 1)
#' @export
#'
#' @examples
#'
#' image01 <- imager::cimg(array(1,c(10,10,5,3)))
#' nameFileImag <- "Image.bmp"
#' tryGrayScale(image01, nameFileImag)
#'
tryGrayScale <- function(image01, nameFileImag){

  message01 <- "the image"
  message01 <- paste(message01, nameFileImag)

  oldw <- getOption("warn")
  options(warn = -1)

  distribution <- NULL

  if (dim(image01)[4] == 4){
    message01 <- paste(message01, "has four channels and can't be grayscale.")
    print(message01)
  }else{

    tryCatch({
      distribution <- imager::grayscale(image01, method = "Luma", drop = TRUE)
    }, error = function(e){
      message01 <- paste(message01, "can't be grayscale.")
      print(message01)
    })
  }

  options(warn = oldw)

  return(distribution)

}

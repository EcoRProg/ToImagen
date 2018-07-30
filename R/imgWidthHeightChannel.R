#' gets the width, height and channels number values from image file
#'
#' @param pathFile : string (path)
#' @param nameFileImag01 : string (file name)
#'
#' @return vector of numbers
#' @export
#'
#' @examples
#'
#' pathFile <- "C:/Images"
#' nameFileImag01 <- "Image.bmp"
#' imgWidthHeightChannel(pathFile, nameFileImag01)
#'
imgWidthHeightChannel <- function(pathFile, nameFileImag01){

  image01 <- ToImagen::loadImagSelect(pathFile, nameFileImag01)

  if(typeof(image01) == "NULL"){
    vecData <- c(0, 0, 0)
    return(vecData)
  }

  vecData <- c(dim(image01)[1], dim(image01)[2], dim(image01)[4])

  return(vecData)
}

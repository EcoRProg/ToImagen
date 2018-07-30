#' gets the values range from image file
#'
#' @param pathFile : string (path)
#' @param nameFileImag01 : string (file name)
#'
#' @return vector of real numbers
#' @export
#'
#' @examples
#'
#' pathFile <- "C:/Images"
#' nameFileImag01 <- "Image.bmp"
#' imgRangeMinMax(pathFile, nameFileImag01)
#'
imgRangeMinMax <- function(pathFile, nameFileImag01){

  image01 <- ToImagen::loadImagSelect(pathFile, nameFileImag01)

  if(typeof(image01) == "NULL"){
    vecData <- c(0, 0)
    return(vecData)
  }

  vecData <- range(image01)
  return(vecData)
}

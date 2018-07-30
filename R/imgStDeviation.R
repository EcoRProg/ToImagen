#' gets the standard deviation value from image file
#'
#' @param pathFile : string (path)
#' @param nameFileImag01 : string (file name)
#'
#' @return number
#' @export
#'
#' @examples
#'
#' pathFile <- "C:/Images"
#' nameFileImag01 <- "Image.bmp"
#' imgStDeviation(pathFile, nameFileImag01)
#'
imgStDeviation <- function(pathFile, nameFileImag01){

  image01 <- ToImagen::loadImagSelect(pathFile, nameFileImag01)

  if(typeof(image01) == "NULL"){
    imgStdevi <- 0
    return(imgStdevi)
  }

  imgStdevi <- stats::sd(image01)

  return(imgStdevi)
}

#' shows the image histogram
#'
#' @param pathFile : string (path)
#' @param nameFileImag : string (file name)
#'
#' @return NULL
#' @export
#'
#' @examples
#'
#' pathFile <- "C:/Images"
#' nameFileImag <- "Image.bmp"
#' imgHistogram(pathFile, nameFileImag)
#'
imgHistogram <- function(pathFile, nameFileImag){

  newPathFile <- ToImagen::buildpathFileAndNameValid(pathFile, nameFileImag)

  if (typeof(newPathFile) == "NULL")
    return()

  image01 <- ToImagen::loadImagSelect(pathFile, nameFileImag)

  if(typeof(image01) == "NULL")
    return()

  imgData <- ToImagen::imgWidthHeightChannel(pathFile, nameFileImag)
  if(sum(imgData) == 0)
    return()

  distribution <- ToImagen::tryGrayScale(image01, nameFileImag)

  if(typeof(distribution) == "NULL")
    return()

  breaks01 = seq(0.0, 1.0, by=0.001)


  graphics::hist(distribution, main = nameFileImag, breaks01)

  return()
}

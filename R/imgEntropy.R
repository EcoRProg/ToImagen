#' gets the entropy value from image file
#'
#' @param pathFile : string (path)
#' @param nameFileImag01 : string (file name)
#'
#' @return  number
#' @export
#'
#' @examples
#' pathFile <- "C:/Images"
#' nameFileImag01 <- "Img01.bmp"
#' imgEntropy(pathFile, nameFileImag01)
#'
imgEntropy <- function(pathFile, nameFileImag01){


  image01 <- ToImagen::loadImagSelect(pathFile, nameFileImag01)

  if(typeof(image01) == "NULL")
    return(0)

  imgData <- ToImagen::imgWidthHeightChannel(pathFile, nameFileImag01)
  if(sum(imgData) == 0)
    return(0)

  distribution <- ToImagen::tryGrayScale(image01, nameFileImag01)

  if(typeof(distribution) == "NULL")
    return(0)

  breaks01 = seq(0.0, 1.0, by=0.001)

  pea <- graphics::hist(distribution, breaks01, plot = FALSE)
  frec01 <- pea$counts/sum(pea$counts)

  vecAux02 <- as.data.frame(frec01)

  conteoNulo <- 0

  for (i in 1:length(vecAux02[,1])){
    if (vecAux02[i,1]==0.0)
      conteoNulo <- conteoNulo + 1
  }


  longVec <- length(vecAux02[,1])-conteoNulo

  vecAux01 <- vector(length = longVec)

  j <- 0
  for (i in 1:length(vecAux02[,1])){
    if (vecAux02[i,1] > 0.0){
      j <- j+1
      vecAux01[j] <- vecAux02[i,1]
    }
  }

  entropy01 <- -sum(vecAux01 * log2(vecAux01))
  return(entropy01)
}

#' gets the data from a raster image
#'
#' @param pathFile : string (path)
#' @param nameFileImag01 :  string (name image file)
#' @param viewHist : TRUE or FALSE (show histogram)
#' @param viewDatArray : TRUE or FALSE (show show data.frame)
#'
#' @return  vector of numbers
#' @export
#'
#' @examples
#' pathFile <- "C:/Images"
#' nameFileImag01 <- "ImgDataX.csv"
#' imgInfoData <- function(pathFile, nameFileImag01)
imgInfoData <- function(pathFile, nameFileImag01, viewHist = TRUE, viewDatArray = TRUE){

  imgData <- ToImagen::imgWidthHeightChannel(pathFile, nameFileImag01)
  if(sum(imgData) == 0)
    return(c(0,0,0,0,0,0,0))


  imgRangeVal <- ToImagen::imgRangeMinMax(pathFile, nameFileImag01)
  if(sum(imgRangeVal) == 0)
    return(c(0,0,0,0,0,0,0))

  imgShann <- ToImagen::imgEntropy(pathFile, nameFileImag01)
  if(imgShann == 0)
    return(c(0,0,0,0,0,0,0))

  imgStDev <- ToImagen::imgStDeviation(pathFile, nameFileImag01)
  if(imgStDev == 0)
    return(c(0,0,0,0,0,0,0))

  if(viewHist == TRUE)
    ToImagen::imgHistogram(pathFile, nameFileImag01)

  vecAux01 <- vector(length = 7)

  vecAux01[1] <- imgShann
  vecAux01[2] <- imgStDev
  vecAux01[3] <- imgData[1]
  vecAux01[4] <- imgData[2]
  vecAux01[5] <- imgData[3]
  vecAux01[6] <- imgRangeVal[1]
  vecAux01[7] <- imgRangeVal[2]

  matInfo <- matrix(0, ncol=7, nrow=1)
  matInfo[1,] <- vecAux01

  imgDataFrame <- data.frame(nameFileImag01, matInfo)

  cnames <- c("Image Name", "Entropy", "Std deviation", "Width", "Height", "Channels", "Min value", "Max value")
  colnames(imgDataFrame) <- cnames

  if(viewDatArray == TRUE)
    print(imgDataFrame)

  return(vecAux01)
}

#' gets the data from a raster images set
#'
#' @param pathFile : string (path)
#' @param pathFileCsv : string (path CSV file)
#' @param nameFileCsv : string (name CSV file)
#' @param saveCsvFile : TRUE or FALSE
#' @param withGraphic : TRUE or FALSE
#'
#' @return  data.frame file
#' @export
#'
#' @examples
#' pathFile <- "C:/Images"
#' pathFileCsv <- "C:/Csv"
#' nameFileCsv <- "ImgDataX.csv"
#' dataFrame <- ImgAllInfoData(pathFile, pathFileCsv, nameFileCsv)
ImgAllInfoData <- function(pathFile, pathFileCsv, nameFileCsv = "File_001.csv", saveCsvFile = TRUE, withGraphic = TRUE){

  graphics::layout(t(1:3))

  pathValid <- ToImagen::listFileFormpathFileValid(pathFile)

  if(pathValid[1]== TRUE){
    listFile <- pathValid[2]
    listFileDir <- listFile[[1]]
  }else{
    return(NULL)
  }

  inic <- TRUE

  for(thisFile in listFileDir){
    extFile <- substring(thisFile, nchar(thisFile)-2, nchar(thisFile))

    if(tolower(extFile) == "jpg" || tolower(extFile) == "bmp" || tolower(extFile) == "png"){
      if(inic){
        inic<- FALSE
        vecNameFileImg <- c(thisFile)
      }else{
        vecNameFileImg <- c(vecNameFileImg, thisFile)
      }
    }
  }

  matInfo <- matrix(0, ncol=7, nrow=length(vecNameFileImg))

  inic <- TRUE

  for (indi in 1:length(vecNameFileImg)) {

    infoImag <- ToImagen::imgInfoData(pathFile, vecNameFileImg[indi], TRUE, FALSE)

    matInfo[indi,] <- infoImag
  }

  imgDataFrame <- data.frame(vecNameFileImg, matInfo)

  cnames <- c("Image Name", "Entropy", "Std deviation", "Width", "Height", "Channels", "Min value", "Max value")
  colnames(imgDataFrame) <- cnames

  print(imgDataFrame)

  if(saveCsvFile == TRUE)
    ToImagen::saveTableInfoImg(pathFileCsv, nameFileCsv, imgDataFrame)

  viewImg <-  NULL

  if(withGraphic == TRUE){
    viewImg <- ToImagen::viewGraphicInfo(imgDataFrame, 1, 3)
    print(viewImg)
  }

  return(imgDataFrame)
}

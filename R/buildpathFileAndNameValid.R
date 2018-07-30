#' creates the full path to an existing file in a directory
#'
#' @param pathFile : string (path)
#' @param nameFileImag : string (file name)
#'
#' @return NULL or string (full path)
#' @export
#'
#' @examples
#' pathFile <- "C:/Images"
#' nameFileImag <- "Image.bmp"
#' buildpathFileAndNameValid(pathFile, nameFileImag)
#'
buildpathFileAndNameValid <- function(pathFile, nameFileImag){

  posic <- 1

  existe <- FALSE

  pathValid <- ToImagen::listFileFormpathFileValid(pathFile)

  if(pathValid[1]== TRUE){
    listFile <- pathValid[2]
    listaux <- listFile[[1]]

    for (indi in 1:length(listaux)) {
      if (nameFileImag == listaux[indi]){
        posic <- indi
        existe <- TRUE
      }
    }
  }else{
    pathFile <- NULL
    return(pathFile)
  }

  if (existe)
    pathFile <- paste(pathFile,listaux[posic],sep='/')
  else{
    pathFile <- NULL
    warning("The file don't exists")
  }

  return(pathFile)
}

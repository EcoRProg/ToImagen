#' read image file
#'
#' @param pathFile : string (path)
#' @param nameFileImag : string (file name)
#'
#' @return NULL or image file
#' @export
#'
#' @examples
#'
#' pathFile <- "C:/Images"
#' nameFileImag <- "Image.bmp"
#' loadImagSelect(pathFile, nameFileImag)
#'
loadImagSelect <- function(pathFile, nameFileImag){

  extFile <- substring(nameFileImag, nchar(nameFileImag)-2, nchar(nameFileImag))

  sigo <- FALSE
  if(tolower(extFile) == "jpg" || tolower(extFile) == "bmp" || tolower(extFile) == "png"){
    sigo <- TRUE
  }

  if(!sigo){
    warning("invalid extension")
    return(NULL)

  }

  newPathFile <- ToImagen::buildpathFileAndNameValid(pathFile, nameFileImag)

  if (typeof(newPathFile) == "NULL")
    return(NULL)
  if(nchar(newPathFile)>nchar(pathFile))
    image01 <- ToImagen::loadThisImag(newPathFile)
  else{
    warning("the path is wrong")
    return(NULL)
  }

  return(image01)
}

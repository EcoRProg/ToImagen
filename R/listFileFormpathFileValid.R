#' creates a existing files names list of a directory
#'
#' @param pathFile : string (path)
#'
#' @return TRUE or FALSE , string vector or NULL
#' @export
#'
#' @examples  listFile <- listFileFormpathFileValid("C:/Users/user/Documents") if(listFile[1]== TRUE){newListFile <- listFile[2]}
#'
listFileFormpathFileValid <- function(pathFile){
  existe <- FALSE
  listFile <- NULL

  listFile <- dir(path = pathFile)

  if (length(listFile) > 0){
    existe <- TRUE
  }else
    warning("Invalid path. Path doesn't exist or is empty folder.")


  return(list(existe, listFile))
}

#' read CSV file
#'
#' @param pathFileCsv : string (path CSV file)
#' @param nameFileCsv : string (name CSV file)
#'
#' @return  NULL or data.frame
#' @export
#'
#' @examples
#'
#' pathFileCsv <- "C:/Images"
#' nameFileCsv <- "Image.bmp"
#' loadTableInfoImg(pathFileCsv, nameFileCsv)
#'
loadTableInfoImg <- function(pathFileCsv, nameFileCsv){

  imgDataTable <- NULL

  oldw <- getOption("warn")
  options(warn = -1)

  pathAndNameCsv <- paste(pathFileCsv,nameFileCsv,sep='/')

  outTryCatch <- tryCatch({
    imgDataTable <- utils::read.csv(file = pathAndNameCsv, header=TRUE, sep=",")

    options(warn = oldw)


  }, error = function(e) {
    print('error trying to read file')
  })

  options(warn = oldw)

  return(imgDataTable)
}

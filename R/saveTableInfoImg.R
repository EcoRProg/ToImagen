#' save data.frame
#'
#' @param pathFileCsv : string (path CSV file)
#' @param nameFileCsv : string (name CSV file)
#' @param dataCsv : data.frame
#'
#' @return : TRUE or FALSE
#' @export
#'
#' @examples
#'
#' vecNameFileImg <- c("Imagen", "Entropy", "Channels")
#' dataCsv <- data.frame(vecNameFileImg)
#'
#' pathFileCsv <- "C:/CSV"
#' nameFileCsv <- "tableInfo.csv"
#' saveTableInfoImg(pathFileCsv, nameFileCsv, dataCsv)
#'
saveTableInfoImg <- function(pathFileCsv, nameFileCsv, dataCsv){

  oldw <- getOption("warn")
  options(warn = -1)

  saveInfo <- FALSE

  pathAndNameCsv <- paste(pathFileCsv,nameFileCsv,sep='/')

  outTryCatch <- tryCatch({

    utils::write.csv(dataCsv, file = pathAndNameCsv)
    options(warn = oldw)
    saveInfo <- TRUE

  }, error = function(e) {
    print('error trying to write file')
  })

  options(warn = oldw)
  return(saveInfo)
}

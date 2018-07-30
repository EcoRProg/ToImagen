#' shows graphics from image data frame
#'
#' @param imgDataFrameLoc : data.frame
#' @param isData : numeric (data.frame column or field)
#' @param typeGraf : numeric (graphic type)
#'
#' @return 0 or graphic
#' @export
#'
#' @examples
#'
#' vecNameFileImg <- c("Imagen", "Entropy", "Std deviation", "Width", "Height", "Channels", "Min value", "Max value")
#' imgDataFrameLoc <- data.frame(vecNameFileImg)
#' isData <- TRUE
#' typeGraf <- TRUE
#' viewGraphicInfo(imgDataFrameLoc, isData, typeGraf)
#'
viewGraphicInfo <- function(imgDataFrameLoc, isData, typeGraf){

  thisData <- NULL

  if(isData == 1){
    if(typeof(imgDataFrameLoc$Entropy) != "double")
      return(0)

    thisData <- imgDataFrameLoc$Entropy
    labX <- "Entropy"
  }

  if(isData == 2){
    if(typeof(imgDataFrameLoc$`Std deviation`) != "double")
      return(0)

    thisData <- imgDataFrameLoc$`Std deviation`
    labX <- "Std deviation"
  }

  if(isData == 3){
    if(typeof(imgDataFrameLoc$Width) != "double")
      return(0)

    thisData <- imgDataFrameLoc$Width
    labX <- "Width"
  }

  if(isData == 4){
    if(typeof(imgDataFrameLoc$Height) != "double")
      return(0)

    thisData <- imgDataFrameLoc$Height
    labX <- "Height"
  }

  if(isData == 5){
    if(typeof(imgDataFrameLoc$Channels) != "double")
      return(0)

    thisData <- imgDataFrameLoc$Channels
    labX <- "Channels"
  }

  if(isData == 6){
    if(typeof(imgDataFrameLoc$`Min value`) != "double")
      return(0)

    thisData <- imgDataFrameLoc$`Min value`
    labX <- "Min value"
  }

  if(isData == 7){
    if(typeof(imgDataFrameLoc$`Max value`) != "double")
      return(0)

    thisData <- imgDataFrameLoc$`Max value`
    labX <- "Max value"
  }


  if(thisData != "NULL"){
    gg <- 0

    if(typeGraf == 1){
      gg <- ggplot2::ggplot(imgDataFrameLoc, ggplot2::aes(x = thisData)) + ggplot2::geom_histogram() +
        ggplot2::labs(subtitle="Group of images", y="Image Data", x=labX,
                      title="Histogram graph",
                      caption = "Local Directory")
    }

    if(typeGraf == 2){
      gg <- ggplot2::ggplot(imgDataFrameLoc, ggplot2::aes(x = thisData)) + ggplot2::geom_density() +
        ggplot2::labs(subtitle="Group of images", y="Image Data", x=labX,
                      title="Density graph",
                      caption = "Local Directory")
    }

    if(typeGraf == 3){
      thisData <- imgDataFrameLoc$Entropy
      thisDat3 <- imgDataFrameLoc$Channels
      thisDat5 <- imgDataFrameLoc$`Std deviation`
      gg <- ggplot2::ggplot(imgDataFrameLoc, ggplot2::aes(x = thisData, y = thisDat5,  shape = (thisDat3 == 1), color= (thisDat3 == 3))) + ggplot2::geom_point() +
        ggplot2::labs(subtitle="Group of images", y="Std dev value", x="entropy value",
                      title="Point geometry: entropy - std deviation",
                      caption = "Courtesy of DM")
    }

    return(gg)
  }else
    return(0)
}

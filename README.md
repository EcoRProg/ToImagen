# ToImagen

Este paquete provee de funciones que permiten obtener parámetros de una o más imágenes de formato raster; .BMP, .JPG o .PNG ubicadas en un directorio.
Ofrece información de: Entropía, Desvío Estándar, Ancho, Alto.
Normalizados en escala 0 a 1 se tiene Valor máximo y Valor mínimo de intensidad de los píxeles de la imagen.
Se pueden crear: histograma, curvas de densidad de probabilidad y gráfico de puntos


## Prerrequisitos

<!-- En un paquete de R los paquetes necesarios para que funcione se instalan automáticamente, y son los especificados en la seccion imports del archivo DESCRIPTION --> 

Para poder usar este paquete debe tener instalado la biblioteca Cairo y la biblioteca Png utilizados por el paquete imager, en ubuntu: 

```
sudo apt-get install libcairo2-dev
sudo apt-get install  libpng16-dev
```

## Instalación

```r
library(devtools)
# Si no tiene instalado devtools, ejecute install.packages("devtools")
install_github("DanGit01/ToImagen")

```


## Ejemplos
Para los ejemplos puede usar un grupo de imágenes de su preferencia que usted tenga disponible en una carpeta de su PC o usar las imágenes que acompañan en el paquete.
El tipo de imágenes que pueden ser procesadas son de formato raster; .BMP, .JPG y .PNG con hasta tres canales (Ej: R,G,B)


### Ejemplo usando datos provenientes de una carpeta de su PC
En un archivo .Rmd copie y pegue el siguiente código y reemplace las expresiones entre corchetes por los path y nombres de archivo existentes

```r
require(imager) 
require(ggplot2)
require(graphics)
require(ToImagen)

pathFile <- <Directorio donde está el grupo de imágenes. Ej: "C:/Images">
nameFileImag <- <Nombre de una imagen de ese directorio y su extensión. Ej: "Nube.jpg">

pathFileCsv <- <Directorio donde se grabará el archivo con la información. Ej: "C:/scv">
nameFileCsv <- <Nombre del archivo. Ej: "ImgDataX.csv">

infoImag <- imgInfoData(pathFile, nameFileImag)

imgDataFrame <- ImgAllInfoData(pathFile, pathFileCsv, nameFileCsv, TRUE, TRUE)

apac <- saveTableInfoImg(pathFileCsv, nameFileCsv, imgDataFrame)

imgDataTable <- loadTableInfoImg(pathFileCsv, nameFileCsv)

```

### Ejemplo usando datos externos que provee el paquete
En un archivo .Rmd copie y pegue el siguiente código

```r
require(imager) 
require(ggplot2)
require(graphics)
require(ToImagen)

nameFileImag <- "LagoMoraine.jpg"
allFilenameImag <- system.file("extdata", nameFileImag, package="ToImagen", mustWork = TRUE)
tope <- nchar(allFilenameImag) - nchar(nameFileImag)
pathFile <- substr(allFilenameImag, 1, tope)


nameFileCsv <- "File_001.csv"
allFilenameCSV <- system.file("extdata", nameFileCsv, package="ToImagen", mustWork = TRUE)
tope <- nchar(allFilenameCSV) - nchar(nameFileCsv)
pathFileCsv <- substr(allFilenameCSV , 1, tope)


infoImag <- imgInfoData(pathFile, nameFileImag)

imgDataFrame <- ImgAllInfoData(pathFile, pathFileCsv, nameFileCsv, TRUE, TRUE)

apac <- saveTableInfoImg(pathFileCsv, nameFileCsv, imgDataFrame)

imgDataTable <- loadTableInfoImg(pathFileCsv, nameFileCsv)

```

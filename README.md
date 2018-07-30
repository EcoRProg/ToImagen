# ToImagen

Este paquete provee de funciones que permiten obtener parámetros de una o más imágenes de tipo BMP, JPG o PNG ubicadas en un directorio.
Ofrece información de: Entropía, Desvío Estándar, Ancho, Alto.
Normalizados en escala 0 a 1 se tiene Valor máximo y Valor mínimo de intensidad de los píxeles de la imagen.
Se pueden crear gráficos con geometría de histograma, densidad y puntos


## Ejemplo

```r
require(imager) 
require(ggplot2)
require(graphics)

pathFile <- <Directorio donde está el grupo de imágenes. Ej: "C:/Images">
nameFileImag <- <Nombre de una imagen de ese directorio y su extensión. Ej: "Nube.jpg">

pathFileCsv <- <Directorio donde se grabará el archivo con la información. Ej: "C:/scv">
nameFileCsv <- <"Nombre del archivo. Ej: "ImgDataX.csv">

infoImag <- imgInfoData(pathFile, nameFileImag)

imgDataFrame <- ImgAllInfoData(pathFile, pathFileCsv, nameFileCsv, TRUE, TRUE)

apac <- saveTableInfoImg(pathFileCsv, nameFileCsv, imgDataFrame)

imgDataTable <- loadTableInfoImg(pathFileCsv, nameFileCsv)

```

## Prerrequisitos

Para poder usar este paquete debes tener instalados los siguientes paquetes:
```r
imager   - versión 0.41.1 o superior
ggplot2  - versión 3.0.0  o superior
graphics - versión 3.5.1  o superior

```

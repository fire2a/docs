---
title: "Configuración R y GEE"
author: "Felipe de la Barra"
date: "2023-06-23"
output: html_document
---

# Objetivo del script

El objetivo del presente documento es mostrar como configurar R y conectarlo con Google Earth Engine (GEE). Este script y pasos a seguir sólo deberá realizarlos la persona que mantendrá actualizados los mapas.

# Requisitos

## Instalacion de R y RStudio

Para descargar ambos programas puede dirigirse a este [link](https://posit.co/download/rstudio-desktop/ "Descargar R y RStudio") y seguir las instrucciones. En el caso de R, seleccione el que corresponda con su sistema operativo.

[![Descarga de R, paso 1](images/Descarga%20de%20R.png)](https://cran.rstudio.com/)

Luego seleccione cualquiera de las opciones que muestran las flechas rojas y descargue la última versión de R (primera opción). Instale R en su computador.

![Descarga de R, paso 2.](images/Descarga%20de%20R%20paso%202.png)

Una vez instalado, descargue e instale RStudio. Una vez instalado, abra RStudio.

## Creación de proyecto y carpetas requeridas.

Acá dejaré las instrucciones y quizás un código para crear las carpetas que se necesitan y las direcciones asociadas. Adicionalmente instrucciones o un código para revisar que estén todos los archivos necesarios.

## Librerias requeridas

Para utilizar las herramientas de todo el proceso se necesitan los siguientes paquetes y sus dependencias:

-   *tidyverse*

-   *terra*

-   *sf*

-   *rgee*

-   *rgeeExtra*

-   *reticulate*

-   *tmap*

-   *furrr*

-   *geojsonio*

-   *leaflet.extras2*

-   *readxl*

Para instalarlos existen dos opciones:

1.  Corra el siguiente código:

    ```{r librerias, eval=FALSE, warning=FALSE}
    #| message: false
    install.packages(c('tidyverse', 'terra', 'sf', 'rgee', 'rgeeExtra', 'reticulate', 'tmap', 'furrr', 'geojsonio', 'leaflet.extras2', 'readxl'))
    ```

2.  Instale en forma manual los paquetes oprimiendo el botón *Install Packages*, dentro del botón *Tools* en la barra de herramientas superior:

![Descarga de herramientas](images/Descarga%20de%20herramientas1.png)

# Conexión de R con GEE

GEE es una plataforma que combina un catálogo de varios petabytes de imágenes satelitales y conjuntos de datos geoespaciales con capacidades de análisis a escala planetaria ([más info](https://earthengine.google.com/ "Más información de GEE")). Para utilizar esta herramienta es necesario tener una cuenta de *Google Drive* asociada a la plataforma, es decir una cuenta de gmail. Adicionalmente debe tener instalado y configurado el paquete `rgee` ([más info](https://r-spatial.github.io/rgee/index.html "Info de rgee")).

Para crearse una cuenta en GEE, dirijase a este [link](https://earthengine.google.com "Crear cuenta en GEE."), oprima el boton *Get Started* y siga las instrucciones.

Por otro lado, para configurar el paquete `rgee`, debe correr la función `ee_check()`. Esta le preguntará si desea instalar python (si es que no lo tiene instalado/disponible), confirme, guarde la dirección de python que la consola de r le mostrará al final y cierre **R**.

```{r instalando_GEE, eval=FALSE}
library(tidyverse)
library(rgee)
ee_check()
```

Luego deberá configurar la *API de Google Earth Engine* abriendo la consola de *Anaconda* instalada recientemente por el paquete `rgee` y activando el medioambiente de *r-reticulate* [(ayuda)](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html "Guía para activar medioambiente de python")*.* Luego deberá ingresar en la consola el siguiente código: `conda install -c conda-forge earthengine-api` y confirmar la descarga de los módulos necesarios. Una vez finalizado el proceso, cierre la consola.

Abra **R** y vuelva a cargar las librerías requeridas. Inmediatamente, en *"dirección de python"*, escriba la dirección de python que guardó anteriormente, corra el siguiente código y reinicie **R**.

```{r instalando_GEE2, eval=FALSE}
library(tidyverse)
library(rgee)

rgee::ee_install_set_pyenv(py_path = "dirección de python")
```

Una vez configurado el paquete, siga las instrucciones que irán apareciendo a medida que corra el código a continuación. En este, debe reemplazar el nombre de usuario por la de su cuenta de GEE.

Adicionalmente, se recomiendo instalar el módulo de geemap para algunas funciones adicionales, corriendo la línea `py_install('geemap')` en el código de abajo para poder visualizar las capas a descargar y utilizar.

```{r iniciando_GEE, eval=FALSE}
ee_check()
ee_Initialize(user = 'ee-usuario_GEE' ,drive = TRUE)
py_config()
py_install('geemap')
```

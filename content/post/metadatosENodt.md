+++
author = "Alberto Moyano"
title= "Metadatos en Libre Office"
date = 2024-01-24
description = "Metadatos en Libre Office"
tags = ["Libre Office", "LaTeX", "gbTeXpublisher", "Metadatos",]
pin = true
+++

Me complace informar que se ha lanzado una nueva versión de gbTeXpublisher, la cual está disponible para su descarga. Esta actualización presenta varias mejoras, siendo la más destacada la capacidad de compilar con salida a LibreOffice y MS Word con los metadatos incrustados.

<!--more-->

¿Por qué generar una salida desde LaTeX a LibreOffice después de completar el proceso de edición y obtener el PDF, el ePub y el XML necesarios para la publicación en línea? La respuesta radica en la posibilidad de conservar en el formato original utilizado por el autor todos los cambios realizados durante el proceso de edición.

Además, brinda la opción de poner a disposición para su descarga el archivo **`.odt`** o **`.docx`**.

En este proceso, se están utilizando los términos de Dublin Core,[^1] los cuales pueden consultarse en [esta página](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/).

La imagen a continuación ilustra el resultado obtenido, estoy utilizando la herramienta **`exiftool`** para visualizar los metadatos, se puede obtener desde [esta página](https://exiftool.org/).

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/metadatosodt.png)

En el siguiente video se puede observar todo el proceso.

{{< youtube 3jF5WhDHKIM >}}

Este es el _link_ de descarga de la última versión de [gbTeXpublisher](https://www.dropbox.com/scl/fi/vasjuzz5izgpw7zo9gkdd/gbTeXpublisher-0.0.558.tar.gz?rlkey=5zq9m9qfra2l5vkox82s63it1&dl=1).

[^1]: Para saber más, véase [Dublin Core](https://es.wikipedia.org/wiki/Dublin_Core).

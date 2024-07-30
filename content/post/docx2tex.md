+++
author = "Alberto Moyano"
title= "Utilizar docx2tex"
date = 2024-02-18
description = "Utilizar docx2tex en gbTeXpublisher"
tags = ["LaTeX", "gbTeXpublisher",]
pin = true
+++

gbTeXpublisher suma la posibilidad de convertir los archivos docx a tex utilizando docx2tex.

<!--more-->

Ahora, cuando abrimos el formulario para realizar la conversión podemos elegir entre las dos opciones (Pandoc viene seleccionada por _default_).

Dentro de las diferencias operativas veremos que docx2tex no necesita que indiquemos un nombre para el destino.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/docx2tex.png)

Su principal ventaja frente a Pandoc es que no falla, literal, hice más de 100 pruebas en archivos muy manoseados y mal construidos, y no obtuve errores en ningún caso.

Su principal desventaja es que el proceso es lento comparado con Pandoc, que sencillamente es instantáneo.

Si la conversión que necesitamos se realiza sobre un archivo medianamente bien construido en MS Word, es decir, sospechamos que tendrá poca basura a nivel código, Pandoc sigue siendo la mejor opción.

Esta forma de convertir archivos de Microsoft Word (docx) en archivos de LaTeX se agrega para solucionar algunos inconvenientes que encuentro en la conversión realizada desde Pandoc.

docx2tex no es una dependencia de gbTeXpublisher, por consiguiente es necesario hacer la instalación por fuera, el método que propongo es hacerlo a través de clonar el repositorio, por _default_, gbTeXpublisher irá a buscar la carpeta docx2tex al **`home`** del usuario, así que sugiero hacer la clonación en ese lugar.

```
git clone https://github.com/transpect/docx2tex --recursive
```

docx2tex fue desarrollado por [le-tex](https://www.le-tex.de/en/company.html), basado en el marco [transpect](https://transpect.github.io/). El autor principal de [docx2tex](https://github.com/transpect/docx2tex) es [mracetke](https://github.com/mkraetke).

+++
author = "Alberto Moyano"
title= "Opciones tipográficas"
date= "2022-01-13"
description = "Trabajar estilos tipográficos en el interior de los libros con condicionales"
tags = [
    "LaTeX",
    "edición",
    "tipografía",
]
categories = [
    "edición",
]
+++

Este artículo pretende desarrollar un ejercicio con las *features* que poseen las tipografías [OpenType](https://es.wikipedia.org/wiki/OpenType) y mostrar:

<!--more-->

1. la capacidad de trabajo con estas *features* que tiene [LaTeX](https://es.wikipedia.org/wiki/LaTeX) utilizando los *drivers* de [XeTeX](https://es.wikipedia.org/wiki/XeTeX) o [LuaTeX](https://en.wikipedia.org/wiki/LuaTeX);[^poder]
2. que no es complicado de llevar a cabo.

## Primero lo primero

> (...) La tipografía es un medio eficientemente utilitario y solo accidentalmente estético, ya que el goce visual de las páginas constituye rara vez la aspiración del lector (Stanley Morrison 1942).

Antiguamente, la mayoría de los tipos de letra tenían diferentes diseños para diferentes tamaños de impresión, esa necesidad surgió inicialmente (en la época del plomo) por las limitaciones técnicas que existían para la fabricación de los tipos móviles y continuó con los inconvenientes generados con la ganancia de punto en los primeros tiempos de la impresión moderna.[^ganancia] Con la llegada de la tipografía digital estas variaciones ópticas se han podido optimizar para su uso en rangos de tamaños de puntos específicos. Varias fuentes incluyen cuatro o cinco variaciones de diseño óptico. Los tamaños previstos exactos varían según la familia (y el diseñador), aunque los rangos de tamaño típicos los podemos encontrar en:

1. **Caption**: hasta 8 puntos.
2. **Text**: de 9 a 13 puntos.
3. **Subhead**: de 14 a 24 puntos.
4. **Display**: de 25 a 72 puntos.

En algunas tipografías está presente una quinta variación para valores mayores a 72 puntos (**Poster**).

Básicamente, las modificaciones en el diseño se encuentran en las **zonas críticas** de algunos caracteres, en la figura a continuación se pueden observar fácilmente las diferencias.

![](https://albertomoyano.github.io/gbTeXpublisher/images/letraA.png)

Este es un ejemplo de Minion Pro (para un mismo cuerpo), vemos la letra **a** en bold, de: **Caption**, **Text**, **Subhead** y **Display**.

## Haciendo una pausa

Excede el propósito de este artículo hablar de la tecnología OpenType, solo me voy a limitar a decir y mostrar que en este formato de fuente el diseñador de la tipografía puede incluir una gran cantidad de *features*, con la aplicación [otfinfo](https://www.lcdf.org/type/otfinfo.1.html) podemos saber cuales están disponibles, la figura a continuación muestra el listado disponible en la tipografía Minion Pro, otra forma de saber cuáles *features* están en el diseño de la tipografía, es abrirla con algún editor de fuentes, por ejemplo con [fontforge](https://fontforge.org/en-US/).

![](https://albertomoyano.github.io/gbTeXpublisher/images/dolphin1.png)

Como ejemplo comparativo, a continuación podemos observar que el diseño de [Linux Libertine](http://linuxlibertine.sourceforge.net/Libertine-EN.html) es más generoso en cuanto a cantidad de *features*.

![](https://albertomoyano.github.io/gbTeXpublisher/images/libertine.png)

La mayoría de los programas de [DTP](https://es.wikipedia.org/wiki/Autoedici%C3%B3n) traen acceso al uso de algunas de estas *features*, pero no a todas, ya que su configuración es muy compleja de llevar a una interfaz gráfica (hablo desde la programación), lo que deja como resultado que muchas de las *features* disponibles en una fuente tipográfica no puedan ser utilizadas en estos programas.

## ¿Y los estilos?

Los estilos tipográficos son básicamente las diferentes características visuales (tamaño, color y posición) aplicados como atributos a las distintas partes del texto (títulos, párrafos, epígrafes, etcétera). Y la herencia de estilos, es básicamente la capacidad de transportar los valores de un estilo a otro nuevo para en él hacer cambios en alguno de sus atributos. La imagen a continuación es una captura parcial de [Scribus](https://www.scribus.net/) 1.5.7 y difiere con la de InDesign o Quark Xpress en su diseño y ubicación de los elementos, pero no más que eso.

![](https://albertomoyano.github.io/gbTeXpublisher/images/scribus.png)

Una **incapacidad concreta en todos los programas de DTP**, es no poder hacer un uso intensivo del valor (y sub) del atributo *fontfamily* que poseen las tipografías, por ejemplo, si quisiéramos trabajar con Minion Pro y utilizar la variante **Text** para el cuerpo del texto principal y la variante **Subhead** para los títulos, necesitamos hacer 2 estilos separados, ya que las tipografías no son vistas por el programa como una sola.

## Trabajando con *fontspec*

En función de lo dicho en el párrafo anterior, el objetivo es mostrar que --en este caso, LaTeX mediante-- Minion Pro puede ser tratada como una sola fuente tipográfica y que la elección de cuál corresponde usar en cada oportunidad, se relacione directamente con el tamaño del cuerpo tipográfico involucrado.

> fontspec es un paquete para XeLaTeX y LuaLaTeX. Proporciona una interfaz automática y unificada para fuentes [AAT](https://es.wikipedia.org/wiki/Ligadura_(tipograf%C3%ADa)) y OpenType ricas en funciones a través de [NFSS](https://www.ctan.org/pkg/nfssfont).

El siguiente código es el que utilizo generalmente, se observan varias cosas: 1) entre las líneas 4 y 8 determino el rango de valores (en puntos), esta opción hace que el compilador sepa que fuente corresponde y cuando y 2) altero el valor por *default* de relación para normal/bold, para pasarlo a normal/semibold.

    \setmainfont{Minion Pro}
    [Numbers={OldStyle,Proportional},Ligatures=TeX,
    Scale=1.2,
    SizeFeatures={
      {Size={-8.4},Font=* Capt},
      {Size={8.41-13.0},Font=*},
      {Size={13.01-21},Font=* Subh},
      {Size={21.01-},Font=* Disp}},
    UprightFont=*-Regular,
    ItalicFont=*-It,
    BoldFont=*-Semibold,
    BoldItalicFont=*-SemiboldIt]

El manual de *fontspec* tiene más de 120 páginas, lo que es un indicador de que sus capacidades son muchas.

Para entender mejor el tema, en LaTeX, los estilos tipográficos son una configuración hija dentro de un valor madre (la estructura), por eso primero se diseñan los valores de las partes de la estructura que a su vez contienen a otros valores, por ejemplo los de diseño visual, esto hace posible que la **herencia** --como se la conoce en los programas de DTP-- también pueda ser **condicional**, es decir, que su resultado se modifique según el contexto.

## Veamos un ejemplo

El siguiente código diseña la estructura de los títulos de los capítulos, se puede observar que no hay ninguna indicación de uso de la tipografía Minion Pro, esta es definida en la orden `\setmainfont` (como tipografía principal por *default*), por consiguiente es la que el compilador va a usar si no hay una contraorden, [en este artículo explico «en parte»](http://albertomoyano.xyz/posts/abrev/) esta lógica de trabajo. A su vez, el valor por *default* para el cuerpo principal del texto es de 10pt, y están definidos: `Large` igual a 17pt y `LARGE` igual a 20pt.

    \titleformat{\chapter}[display]
    {\Large}
    {\vspace{-2.5cm}\centering{\textsc{
    \MakeLowercase\chaptertitlename}}~\thechapter}
    {1.5cm}
    {\filright\LARGE}
    []

En el diseño estructural de los títulos de sección se puede observar en la línea 2 el cambio de tipografía (`\sf\...`) que modifica el *default*, se sigue el mismo patrón de lógica, no se indica una tipografía en particular, en este caso que se cambia un *default* (tipografía con serif) por otro *default* (tipografía sin serif).

    \titleformat{\section}[hang]
    {\sf\bfseries\large\raggedright}
    {\thesection}{.5em}{}[]
    \titlespacing{\section}
    {\parindent}{1pc plus .1pc minus -.2pc}{.5pc}

Veamos en la siguiente imagen el resultado del procesamiento.

![](https://albertomoyano.github.io/gbTeXpublisher/images/ejemplo-minion1.png)

Y en esta imagen podemos observar que el PDF contiene empotradas la tipografía en sus variantes Regular (**Text**) y **Subhead**, junto con otras que se utilizan en el pdf.

![](https://albertomoyano.github.io/gbTeXpublisher/images/ejemplo-minion2.png)


[^poder]: Y que hasta el momento no se encuentra disponible en ningún software para edición (léase programa de maquetado) de libros.

[^ganancia]: Situación que ha mejorado mucho, pero que aún hoy continúa, CTP incluido.

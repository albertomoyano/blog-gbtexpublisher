+++
author = "Alberto Moyano"
title= "Énfasis o itálicas (I)"
date= "2022-01-18"
description = "Tips de edición y producción editorial"
tags = [
    "LaTeX",
    "edición",
]
categories = [
    "libros",
]
+++

Doy comienzo a una serie de artículos en los que voy a comentar características interesantes surgidas al calor de la producción editorial trabajando con LaTeX (ya sean de corrección, edición, maquetado o impresión). Si bien todos los libros en su proceso de producción tienen lugares comunes (léase estandarizados) en lo referente al modelo de edición, siempre hay espacio para situaciones especiales, la idea es compartirlas. Como existe la posibilidad de que algunos libros tengan varias situaciones para comentar y, considerando no hacer estos textos muy extensos (ya que la idea es que se conviertan en *tips* de producción), voy a numerar los artículos con mayúsculas en romanos, si más adelante apareciera un artículo donde el número en romano se acompaña de una letra, esto obedece a que ese libro ya fue comentado en otra oportunidad, para esos casos voy a mantener relaciones cruzadas entre los diferentes artículos.

<!--more-->

Énfasis sin lugar a dudas. Está entre las primeras cosas que hago cuando empiezo a revisar el texto, cambiar todas las itálicas por énfasis, ¿por qué?, simple, es otra forma de separar el valor visual del dato.

Primero veamos mejor que hace cada atributo, la itálica aplica su valor de diseño tipográfico al texto seleccionado y este no se ve alterado con su entorno, mientras que el énfasis aplica el valor tipográfico opuesto al heredado, esto quiere decir que si vengo arrastrando el valor normal lo pasa a valor itálica, pero si vengo en itálica lo pasa a normal.

La mejor forma de comprender esto es con los siguientes ejemplos:

Lo primero que se observa es que los 3 puntos de inicio indicados con `\dots` están fuera del énfasis, la cita por estar en idioma diferente al principal va en bastardilla y, en esta colección como parte del estilo, no pueden convivir bastardillas entre comillas --salvo casos particulares--, por eso no hay comillas de apertura; no puse el texto del `\footnote` para acortar el código.


    \begin{quote}
    (\dots) \emph{the credibility of the notion of class domination
    is saved \ \ldash{but then it is of course \emph{given} in all
    varieties of marxism}\rdash \ but the demonstration of such domination
    in the context of particular states remains unacomplished}.\footnote{}
    \end{quote}

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/enfasis1.png)

Ahora veamos como es posible respetar la vieja tradición tipográfica, en la figura a continuación observamos que la **coma** --indicada con el círculo rojo-- no está en bastardilla, ya que el entorno énfasis solo toma a las palabras.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/enfasis3.png)

Esto es posible gracias a que en los lenguajes de marcas (LaTeX o cualquier otro), siempre se tiene mejor control sobre el texto que en el modelo WYSIWYG. Trabajar con estas características trae mejoras sustanciales al momento de hacer control de corrección.



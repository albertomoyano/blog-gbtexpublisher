+++
author = "Alberto Moyano"
title= "Trabajo editorial en el aparato crítico"
date= "2023-03-21"
description = "Sobre abreviaturas utilizadas en el aparato crítico"
tags = [
    "LaTeX",
    "edición",
    "bibtex",
]
categories = [
    "libros",
]
+++


Este listado de abreviaturas es de uso general, pero las aclaraciones al final se limitan al estándar desarrollado por [Iván Valbusa](https://www.ctan.org/pkg/biblatex-philosophy), él toma como base el *default* de BibLaTeX; que si bien tiene muchas similitudes con otros estándares (APA, Chicago, Harvard, etc.), también tiene sutiles diferencias.

<!--more-->

## apud

Significa *en la obra de*, *inspirado por* o *citado por*. Se utiliza cuando el autor de un libro o artículo hace referencia a otro libro o artículo. En un caso así, lo más recomendable es buscar la fuente primaria, pero, si no se encuentra, se consigna una ficha doble: se comienza por los datos del libro que no se tiene, y se termina por los datos de donde se sacó la información.

## art. cit.

Significa *artículo citado*. Tiene todas las especificaciones de *op. cit.*, se utiliza con referencia a artículos aparecidos en revistas.

## circa (alrededor de)

Se utiliza para advertir que la fecha que se anota es estimada.

## cfr. (también puede ser cf.)

Significa *confróntese* o *confróntense*. Se utiliza cuando se quiere recomendar la lectura de alguna fuente, con el propósito de comparar su información con las aseveraciones del ensayo que se está escribiendo.

## cols.

Significa *y colaboradores*. Se utiliza cuando en un libro un autor ha tenido asistencia de algún tipo por parte de otras personas, pero estas no son parte de la autoría del texto.

## et al.

Significa *y otros*. Regularmente se prefiere abreviado. Se utiliza cuando un libro tiene varios autores. El criterio más utilizado es poner al primer autor (en el orden en que aparezcan en la portada) y luego la abreviatura. Solo la segunda partícula lleva punto. Además del punto, debe llevar una coma si la ficha continúa. En el listado representativo del aparato se pueden poner todos los autores intervinientes.

## ibidem (se abrevia ibid.)

Significa *allí mismo*, y se utiliza cuando la referencia inmediatamente anterior es la misma, pero con página diferente.

## idem (se abrevia id.)

Significa *el mismo*, *lo mismo*, y se utiliza cuando la referencia anterior es igual en su totalidad: autor, obra y página. Se recomienda uniformar las citas: si se abrevia una (*ibid.*, *id.*), deben abreviarse todas.

## infra

Significa *más abajo*. Se utiliza para remitir al lector a un pasaje posterior en el trabajo o en el ensayo. Por ejemplo, si en la página 2 del trabajo o del ensayo hay una referencia a algún tema que aparece en la nota 2 (que, a su vez, está en la página 20), la nota a pie de página diría: Véase *infra*, pág. 20, n. 2.

## opus citatum (se abrevia op. cit.)

Significa *obra citada*, se utiliza para no repetir íntegramente los datos de una referencia bibliográfica a la que ya se citó con anterioridad. La referencia solo incluiría el apellido del autor, el título y la página de la que se copia información. Las dos partículas llevan punto porque son abreviaturas; debe haber un espacio en blanco entre las dos partículas. Si después del último punto se pone la página, además del punto, debe llevar una coma. Debe ir en cursivas y en minúsculas.

## pág. / págs.

Significan, *página* y *páginas* respectivamente. Las abreviaturas aparecen antes o después de los números correspondientes. Por ejemplo, si al final de una referencia bibliográfica se consignan las páginas totales de un libro, la abreviatura va al final. Si se consignan las páginas de un artículo o de una cita textual, la abreviatura va antes del número.

## passim

Significa *en varios lugares de la obra*, *abundantemente*, *aquí y allí*. Se utiliza para hacer referencia a un término que aparece frecuentemente en el desarrollo de una fuente (libro, artículo, etcétera). No debe usarse para omitir los números de folio que abarca un artículo.

## ss.

Significa *siguientes*. Se utiliza junto con la abreviatura de *páginas*. En este caso se marca el inicio de un periodo, pero no se marca el final. Igual que en el caso de *passim*, esta abreviatura no debe usarse para evitar mencionar las páginas que abarca un artículo.

## s. v. (sub voce)

Significa *bajo la voz* o *bajo la palabra*. Se utiliza cuando se cita un diccionario, una enciclopedia o un libro de referencia. Puede omitirse el número de página.

## supra

Significa *más arriba*. Se utiliza para remitir al lector a un pasaje anterior dentro del mismo texto. Ejemplo: Véase *supra*, cap. 1.

## véase

Se utiliza para remitir al lector a una fuente cuya lectura se le recomienda para ampliar o verificar la información que se ofrece en el ensayo, así como para remitir al lector a otras partes del mismo ensayo. Puede usarse la abreviatura *vid.*, en cursiva, porque se trata de la locución latina *videtur*, *vide*.

# Algunas particularidades al trabajar con LaTeX y BibLaTeX

Antes que nada es preciso aclarar que el trabajo mostrado a continuación difiere del modelo lineal que es el más común de encontrar, donde el trabajo mostrado es propio (casi exclusivo) de la corrección --y no, de la persona que diseña o maqueta--, en LaTeX los 3 roles (edición, corrección y maquetación) se pueden cruzar durante el proceso, lo que no invalida que estos puedan estar separados en un flujo de producción multidisciplinario. La figura a continuación ilustra la idea.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/circular.png)

Este es el código que utilizo generalmente con BibLaTeX para el modelo autor/año, vale aclarar que las opciones se declaran para modificar el valor por *default* que trae la función (este es el modelo de trabajo **para todo** en LaTeX), en este caso si escribo lowscauthors=true,[^1] es porque su *default* es false.

[^1]: Convertir a minúsculas los nombres de los autores, para que en la conversión a versalitas con la opción scauthorsbib=true, haya uniformidad tipográfica.

    \usepackage[style=philosophy-modern,
    lowscauthors=true,
    scauthorsbib=true,
    annotation=true,
    backend=biber,
    labeldateparts=true,
    sortcites=true,
    backref=true,
    useprefix=true,
    citereset=chapter,
    indexing=cite,
    relatedformat=brackets,
    publocformat=loccolonpub,
    volnumformat=strings,
    latinemph=true,
    inbeforejournal=true,
    shorthandintro=true,
    texencoding=utf8,
    bibencoding=utf8,
    uniquelist=minyear,
    autolang=hyphen]{biblatex}

Y este para el modelo nota a pie de página.

    \usepackage[style=philosophy-verbose,
    ibidpage=true,
    commacit=true,
    latinemph=true,
    backend=biber,
    labeldateparts=true,
    sortcites=true,
    backref=true,
    useprefix=true,
    citereset=chapter,
    indexing=cite,
    relatedformat=brackets,
    publocformat=loccolonpub,
    volnumformat=strings,
    inbeforejournal=true,
    shorthandintro=true,
    texencoding=utf8,
    bibencoding=utf8,
    uniquelist=minyear,
    hyperref=true]{biblatex}

### Sobre el ibidem y el op. cit.

Por *default* la compilación trae habilitada la ruptura del ibidpage **solo** para el listado de la salida, el concepto que se maneja es el de hacer fácil la lectura, entonces, el *ibid*[^2] del autor aparece unicamente sobre la página enfrentada (**de par a impar**), si el autor de la referencia se repite en la página siguiente (**de impar a par**), el compilador va a repetir todos los datos del autor, el objetivo es simple, que el lector no tenga que voltear la página hacia atrás para ver de quién es la autoría, esto se comprende mejor en las 2 imágenes a continuación (hacer clic para zoom si no se ve bien).

[^2]: El ibid refiere al concepto de no repetir el nombre del autor, en otros diseños de salida es común que se utilice una raya media.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/ibid1.png)

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/ibid2.png)

Ahora veamos el tratamiento del *ibidem* y el *op. cit.* dentro del cuerpo de libro para cuando trabajo con notas a pie de página, en la línea 2 del código anterior (resaltada en gris) se observa que habilité el ibidpage=true, esto es para que el compilador maneje el concepto explicado anteriormente, pero dentro del texto, las figuras a continuación ilustran la codificación y la salida.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/ibid0.png)

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/ibid3.png)

Alguien ya me lo preguntó una vez, así que mejor explicitar lo obvio. **Con este sistema, el corrector elimina como parte de su trabajo controlar de donde vienen y si se corresponden los ibidem y los op. cit.**

La figura que utilizo es de un libro que está en proceso de edición, sobre las franjas en color naranja que aparecen en la cita lo explico en [este artículo](https://albertomoyano.xyz/posts/homearchy/).

### Sobre las referencias relacionadas y/o cruzadas

Si bien es más común de encontrar en compilaciones, también se da a veces en textos de un mismo autor, los motivos de no unificar los materiales de trabajo pueden ser variados y disímiles, creo que lo mejor es respetar las decisiones tomadas por los autores (aunque se puede conversar con ellos para ver que piensan), en la figura a continuación se puede observar un ejemplo de relación entre diferentes referencias internas en un mismo texto, estas pueden diferir en la editorial, año, idioma, traductor, etcétera (voy a aprovechar el campo de nota para dejar aclaraciones sobre las referencias en particular).

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/relacion1.png)

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/relacion2.png)

### Sobre información complementaria

Existen dos posibilidades de agregar información a las referencias, este trabajo puede ser desarrollado por el autor, el corrector o el editor, la primera opción es como **nota** y la segunda como **apunte**. Utilizo colores solo a los efectos de marcar visualmente la diferencia entre los datos.

**Qué se entiende por nota:** a una ampliación puntual (e.g. un resumen) que involucre a la referencia. Esta se imprime en un nuevo párrafo al final y es aconsejable diferenciar la tipografía (para comprender mejor como esta cortada la url mostrada en la figura, se puede leer [este artículo](http://albertomoyano.xyz/posts/ortotipografiaurl/)).

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/nota1.png)

**Qué se entiende por apunte:** a información secundaria a la estructura de datos de la referencia misma, tales como la ubicación de los textos originales, notas históricas, etcétera. Esta se imprime dentro del párrafo que construye la referencia.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/apunte1.png)

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/apunte2.png)

La cantidad de opciones de configuración exceden este *post*, esto son solo apuntes generales, la suma de los tres principales manuales para manejo de bibliografía en BibLaTeX suman más de 1.000 páginas.[^bib]

[^bib]: Si se suman todos los manuales de todos los estilos que maneja BibLaTeX, son más de 4.000 páginas.

+++
author = "Alberto Moyano"
title= "Referencias audiovisuales"
date= "2021-12-30"
description = "Ejemplo de configuración para representar elementos audiovisuales en el aparato bibliográfico"
tags = [
    "bibTeX",
    "edición",
    "JabRef",
]
categories = [
    "edición",
]
+++

Ya llevo varios libros editados que involucran películas (creo que son más de 12) y en todo este tiempo he estado lidiando con parches y diciéndome que en algún momento voy a tener que parametrizar una salida para las referencias de películas.

<!--more-->

Desde hace bastante tiempo utilizo el estándar desarrollado por [Iván Valbusa](https://www.ctan.org/pkg/biblatex-philosophy), es extremadamente limpio, permite una lectura ágil y sólida y tiene base en el estándar de [BibLaTeX](https://www.ctan.org/pkg/biblatex) y como no tengo ganas de empezar desde cero, considero que lo mejor es hacer el [*driver*](https://enclavedeciencia.rae.es/diccionarios/dei/search/zones?zones%5B%5D=header:driver) de salida para el estándar que ya uso.

## Por donde empezar

Lo primero fue estudiar otros estándares que tienen soporte para películas de manera nativa, esto me permitió hacer una elección con base comparativa, tome como objeto de estudio [APA](https://www.ctan.org/pkg/apa) y [FIWI](https://www.ctan.org/pkg/biblatex-fiwi). Lo segundo fue definir el camino a seguir, esto es:

1. desarrollar un *driver* de salida desde cero;
2. clonar un *driver* existente y adaptarlo (por ejemplo artículo de revista).

Opté por tomar el camino más práctico (clonar un *driver* existente); expongo de manera muy sencilla las conclusiones de revisar mis objetos de estudio.

## El estándar de APA

Como no podía ser de otra manera, el estilo APA es muy generoso a la hora de considerar los elementos que se involucran en una referencia para trabajos audiovisuales, pero tampoco se traiciona, esto es, sigue con sus inconsistencias al tema género y para este tema en particular no privilegia el título de las películas, generando un índice muy malo al momento --me pongo en lector-- de querer hacer un trabajo de investigación con los datos.

## El estándar FIWI (estilo para estudiosos del cine)

Cuando descubrí el trabajo de [Simon Spiegel](https://www.film.uzh.ch/de/team/mitarbeitende/privatdozierende-und-wissenschaftliche-Mitarbeitende/spiegel.html) no lo podía creer, tal vez haya otros, pero esta es la primera vez que veo a alguien especializado en un tema hacer un estilo –100% completo– para su tesis doctoral, haciendo foco en las referencias audiovisuales. Incluso consideré tomarlo como estilo propio, pero al estudiarlo en detalle encontré que su diseño está muy lejos de lo que tengo y/o pretendo obtener, por consiguiente el trabajo de adaptación es muy grande.

## Como seguir

La primer decisión tomada es la de clonar el *driver* del tipo *misc*, para un tipo *movie*, esto quiere decir que los elementos ya tienen un orden preestablecido y no es necesario hacer el desarrollo, esto se hace con la función alias como se muestra a continuación:

    \DeclareBibliographyAlias{movie}{misc}

Luego, tuve que definir las variables para el tipo de entrada, estas van a ser usadas tanto por el *driver* de mapeo como por el de salida, se pueden agregar más tipos de entradas y el orden de salida se va a ajustar al índice alfabético del tipo de editor, esto es, desde ahí se decide que orden de salida se quiere.

    \NewBibliographyString{dirigida}
    \NewBibliographyString{dirigidas}
    \NewBibliographyString{bydirigida}
    \NewBibliographyString{escrita}
    \NewBibliographyString{escritas}
    \NewBibliographyString{byescrita}
    \NewBibliographyString{elenco}
    \NewBibliographyString{elencos}
    \NewBibliographyString{byelenco}

    \DefineBibliographyStrings{spanish}{
    dirigida = {direcci\'on},
    dirigidas = {direcci\'on},
    bydirigida = {direcci\'on de},
    escrita = {escrita},
    escritas = {escrita},
    byescrita = {escrita por},
    elenco = {act\'uan:},
    elencos = {act\'uan:},
    byelenco = {act\'uan:},
    }

Utilizo [JabRef](https://www.jabref.org/) como programa para administrar la base de datos bibliográfica, entonces, lo primero que hice fue crear un tipo de entrada *movie*, para tenerlo como opción de ABM (alta, baja y modificación) de los datos, el resultado se puede observar en la siguiente figura.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/jabrefmovie.png)

En la figura a continuación se puede observar como quedan los datos dados de alta.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/jabref-ejemplo.png)

Dejo la muestra de los datos en la tabla para quienes no usen JabRef.

    @Movie{Conspiracy2001,
    Title = {Conspiracy},
    Date = {2001},
    Editora = {Frank Pierson},
    Editoratype = {dirigida},
    Editorb = {Loring Mandel},
    Editorbtype = {escrita},
    Editorc = {Kenneth Branagh and Stanley Tucci and Colin Firth},
    Editorctype = {elenco},
    Hyphenation = {english},
    Keywords = {filme},
    Location = {Estados Unidos},
    Organization = {HBO Films and BBC}
    }

Utilizo la palabra clave (*keywords*) filme solo para separar este listado del listado de las referencias bibliográficas, esto se comprende mejor en el código a continuación que muestra las instrucciones de salida.


    \section*{Referencias}
    \printbibliography[keyword=listar,heading=none]

    \section*{Filmografía}
    \printbibliography[keyword=filme,heading=none]


## Veamos los resultados

A continuación van figuras ilustrativas que muestran el resultado en la página y en el listado final. Vale aclarar que en los parámetros del *driver* de salida tengo definido un valor = 2 para el número máximo de autores/editores que pueden aparecer en el texto –por eso el sistema coloca un et al.– mientras que utilizo un valor = 99 para el listado general.

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/resultado1.png)

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/resultado2.png)


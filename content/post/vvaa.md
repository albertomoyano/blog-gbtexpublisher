+++
author = "Alberto Moyano"
title= "La bibliografía en libros de VVAA"
date= "2022-01-08"
description = "En una compilación, ¿donde van las referencias bibliográficas?"
tags = [
    "bibTeX",
    "edición",
    "LaTeX",
]
categories = [
    "edición",
]
+++

Como consecuencia de una pregunta que se dio en un [seminario que cursé en la UBA](https://www.linkedin.com/groups/12515598/) en el segundo cuatrimestre de 2021 y, para ampliar mi mirada sobre el tema, decidí hacer una pequeña investigación que involucró a varios autores, correctores profesionales y editores con bastante experiencia, hago explícito que no lo hice con ninguna pretensión de investigación académica ni nada parecido, de ahí también que haya trabajado con un universo pequeño.

<!--more-->

La pregunta fue simple: en un libro[^academia] que es una compilación de varios autores, **donde todos los autores trabajan el mismo tema**, ¿el aparato bibliográfico, debe ir a continuación de cada capítulo o todo junto al final del libro?

Las diferentes respuestas fueron interesantes, porque todas se relacionaban con:

1. Necesidades puntuales del involucrado.
2. Limitaciones en el desarrollo de la edición.
3. Limitaciones en los procesos de producción.
4. Desconocimiento del tema.

Más interesante fue que nadie respondió pensando en el libro como herramienta de investigación.

## Resumiendo las respuestas

El siguiente listado es una síntesis de las respuestas recibidas:

- El autor lo necesita con la bibliografía al final de su capítulo para subirlo al SIGEVA.
- Unificar todo representa mucho más trabajo (y dinero).
- Da lo mismo, es cuestión de marketing ¿?
- Si el corrector no lo arregla, en InDesign eso es imposible.
- La editorial no altera la forma en como los autores mandan los archivos.
- Si no va todo al final parece una revista.

## Mi posición sobre el tema

Las referencias en los documentos académicos llevan por finalidad soportar los argumentos en ellos desarrollados y tienen al menos cuatro propósitos principales:

1. Defender el contenido.
2. Demostrar la honestidad intelectual.
3. Atribuir el trabajo e ideas anteriores o no originales a las fuentes correctas.
4. Ayudar al lector a comprobar la validez del material que el autor ha utilizado.

Lo antes dicho es para sostener la postura de que las referencias bibliográficas en un libro son solo aquellas que están siendo utilizadas (ya sea en cita textual o parafraseada) el resto..., el resto sobra. Digo esto porque es común de ver en la edición de libros académicos que el trabajo de control de datos es el primer trabajo de corrección que se deja de hacer. Problemas de costos, de incapacidad técnica, no lo sé, tampoco importa. Lo que importa es editar sabiendo que las referencias cumplen una o varias funciones al servicio del lector.

No todo es blanco o negro, creo que si los trabajos de investigación versan sobre el mismo tema pero los campos académicos de investigación son muy amplios (en un libro sobre el rol del agua potable --por poner un ejemplo-- se amplia mucho la mirada que existe entre un médico, un geógrafo y un historiador) entonces puede ser válido que las referencias se ubiquen al final de cada capítulo, caso contrario, considero que llevarlas al final del libro, unificadas y eliminando las redundancias es lo ideal.[^trad]

Cuando se corrige, se edita y se publica este tipo de libros no se debe perder el foco: el libro es una herramienta de divulgación científica donde debe primar la legibilidad, entonces, las herramientas que utilicemos, así como el oficio, no pueden ser limitadores.

## Estado del arte

Veamos como es el flujo de trabajo --más común de encontrar-- en la corrección:

1. Se realiza el control de relación de referencias y fuentes entre las que figuran dentro del texto y las que vienen en el listado final del archivo (primera purga de datos).
2. Se sigue con el control de faltante o sobrante de datos para cada referencia, esto es, la correspondencia entre los datos obligatorios y los datos opcionales del estándar de representación adoptado.
3. Para el caso en que la bibliografía sea listada toda junta se realiza una segunda purga de datos, eliminado las referencias reiteradas con 100% de coincidencia.
4. Se realiza el trabajo de corrección de estilo (para el modelo cíclico de producción esta es la primera corrección en diseño).

Es posible que dependiendo de la experiencia, tiempo y dinero en juego, los puntos 1 y 2 o 1, 2 y 3 se realicen al mismo tiempo, la descomposición que hago en una lista numerada solo lleva la idea de mostrar los diferentes trabajos involucrados.

5. Se realiza el trabajo de corrección sobre el maquetado (segunda corrección en diseño).

## Otro mundo

Utilizo el lenguaje [LaTeX](https://es.wikipedia.org/wiki/LaTeX) para editar y producir libros, ahora veamos entonces como es el flujo de trabajo en edición y corrección con BibLaTeX:

1. Se construyen las marcas dentro del texto durante el trabajo de ingeniería inversa para el ABM[^abm] junto con la corrección ortográfica.

Este único paso, lleva a los siguientes resultados (aclaro que específicamente para la bibliografía):

1. **No existe la corrección ortotipográfica**.
2. **No existe la corrección de estilo**.
3. **No existe la corrección en el listado general**.
4. **No existe la corrección de referencias relacionadas y/o cruzadas**.
5. **Hay total independencia de la ubicación y del modelo de salida deseado:**
    - general,
    - por capítulo,
    - por tipo de referencia,
    - con diseño personalizado.

Esto es así, ya que **LaTeX interviene en la construcción de los párrafos**, estandarizando la escritura (es interesante observar la diferencia que el sistema hace entre estructura, diseño y dato).

**Prima parte**
{{< youtube laEOTrWCEtM >}}

**Segunda parte**
{{< youtube SBbLk_7lrY4 >}}

En los ejercicios de muestra no trabajé con direcciones electrónicas, pero se puede [leer este artículo](http://albertomoyano.xyz/posts/ortotipografiaurl/) donde trato el tema. Indudablemente, es otro mundo, y el uso es muy simple aunque cueste creerlo. Por eso, me parece oportuno dejar un video (en 2 partes) con el desarrollo de lo expresado anteriormente.

Después de ver los videos, se entiende que la pobreza de los programas (herramientas) de moda para la edición de textos científicos no son un justificativo válido, ya que LaTeX (además de ser gratis) se liberó en la década del 80 --el software tiene más de 40 años-- y tiene versión para Windows, MacOS y GNU/Linux.


[^academia]: El trabajo se corresponde a un libro de académico, este ejercicio no fue considerado para otros textos.

[^abm]: Alta, Baja y Modificación (para este modelo de trabajo sería Corrección) de registros en la base de datos.

[^trad]: Sumando además, que se puede generar mayor valor al contenido (léase complementar información sobre las referencias), por ejemplo para libros en otro idioma, indicar los datos de la versión en español, si la hubiera.

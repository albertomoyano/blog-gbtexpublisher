+++
author = "Alberto Moyano"
title= "URL largas en los libros"
date= "2023-03-21"
description = "URL largas en libros. ¿Son un problema?"
tags = [
    "LaTeX",
    "edición",
    "URL",
]
categories = [
    "libros",
]
+++

Esta situación la vengo revisando desde hace mucho tiempo, pero aún hoy, no sé que solución es la más satisfactoria. El avance de la informatización de los contenidos, va generando inexorablemente más recursos en línea y los autores se ven en la necesidad de indicarlos en sus referencias bibliográficas y citas. Pero cuando una URL no tiene una estructura básica y legible por humanos, del estilo **miweb.com**, la experiencia (propia y ajena) me dice que no tiene ninguna utilidad en un texto impreso; en libros digitales y/o electrónicos es harina de otro costal.

<!--more-->

Observemos la figura a continuación, alguien realmente se pone a tipear una dirección así, personalmente si me interesa acceder a esa URL, termino buscando por el título y/o el autor.

![](https://albertomoyano.github.io/gbTeXpublisher/images/url1.png)

En los libros impresos, creo que una URL debería ser una ruta fácil de escribir en el buscador. Algunas direcciones son especialmente largas, engorrosas (por los tipos de caracteres que llevan) y de difícil abreviación. Es posible utilizar algún servicio para acortar direcciones de internet --[bitly](https://bitly.com/) es un ejemplo-- pero no siempre resultan prácticos, además se pasa a depender de terceros, incluso cuando la dirección que pone el autor sea el resultado de una busqueda --debo aclarar que estas también se puede simplificar-- sigue siendo de dificil comprensión.

Y para cerrar este incordio, se suma cómo y por dónde partir las URL largas. Existen normas puntuales al respecto, pero después de lidiar durante mucho tiempo sobre este tema, he encontrado que utilizar el paquete [url](https://ctan.org/pkg/url) en LaTeX es lo más cómodo, ya que puede cortar las direcciones sin ningún tipo de escrúpulo y, lo más importante, sin utilizar la raya del medio en el salto de línea, ya que la misma (de agregarla) podría ser interpretada como parte de la dirección y esto --corresponde aclaralo-- es un error de ortografía.

![](https://albertomoyano.github.io/gbTeXpublisher/images/url3.png)

En fin, la pregunta sigue en pie: ¿en un texto destinado a ser impreso, son útiles las direcciones de internet largas e ilegibles?

Personalmente creo que si no son cortas y prácticas para el lector, la respuesta inmediata es «no». Pero qué pueden hacer los autores (y los correctores) frente a esto, ya que la cita no puede ser eliminada, veamos que solución considero hoy es posible utilizar.

## QR al rescate

> Un código QR (del inglés *Quick Response* code), es la evolución del código de barras. Es un módulo para almacenar información en una matriz de datos o en un código de barras bidimensional. La matriz se lee en el dispositivo móvil por un lector específico, y de forma inmediata nos lleva a una dirección en Internet (Wikipedia).

Una solución acabada sería imprimir un código QR en lugar de la ruta de la URL, ahora bien, esto es ágil si está automatizado, caso contrario la solución se convierte en una tortura (huyamos del DTP).

La figura a continuación ilustra como se vería el reemplazo de la URL de Ediciones Imago Mundi en la página de legales, la figura puede ser leída con cualquier aplicación lectora de QR desde el celular o tableta y de este modo acceder directamente a la dirección indicada.

![](https://albertomoyano.github.io/gbTeXpublisher/images/qr1.png)

El código que genera esta salida de manera automática es el siguiente,

{{< highlight latex >}}
\noindent \textcopyright~2022, Ediciones Imago Mundi \\
\qrcode[height=0.5in]{https://www.edicionesimagomundi.com/}\\
{{< /highlight >}}

pero sería realmente automática si me permitiera modificar la salida en función de cada necesidad (PDF para imprenta, PDF para pantalla y libro electrónico), ahí es donde entra a jugar el uso de los condicionales, en este caso para LaTeX, pero también cuando utilizo Asciidoc (aunque la codificación es diferente).

> Se puede utilizar la sentencia IF para determinar el flujo del programa en función de la evaluación de la expresión. Si el valor de la expresión es verdadero, se ejecutan las sentencias THEN. Si el valor de la expresión es falso, se omiten las sentencias THEN y se ejecutan las sentencias ELSE (IBM).

Existen varias formas de plantear el uso de condicionales, para este ejercicio voy a utilizar un método eficaz (que permite una lectura fácil a quienes recién empiezan con los lenguajes de marcas), conciente de que hay métodos más eficientes, el código en LaTeX utilizando condicionales para este ejercicio queda entonces de la siguiente manera

{{< highlight latex >}}
\newif\ifincludeQR
\ifdefined\public\else\includeQRtrue\fi
\newif\ifincludeNOMBRE
\ifdefined\public\else\includeNOMBREfalse\fi

(...)

\ifincludeQR
\noindent \textcopyright 2022, Ediciones Imago Mundi \\
\qrcode[height=0.5in]{https://www.edicionesimagomundi.com/}\\
\fi

\ifincludeNOMBRE
\noindent \textcopyright 2022, \href{https://www.edicionesimagomundi.com/}{Ediciones Imago Mundi} \\
\fi
{{< /highlight >}}

Solo es necesario cambiar de **true** a **false** las opciones antes de compilar, y obtendremos un PDF para imprenta (primera imagen) y un PDF para pantalla con hipervínculo activo (segunda imagen).

![](https://albertomoyano.github.io/gbTeXpublisher/images/qr1.png)

![](https://albertomoyano.github.io/gbTeXpublisher/images/qr3.png)

También puede modificarse la ruta de la función **\href** para obtener algo así.

![](https://albertomoyano.github.io/gbTeXpublisher/images/qr2.png)

Queda para otro artículo (es muy extenso y lo tengo en desarrollo) poder mostrar como realizar estos cambios en las URL de los archivos **.bib** en tiempo de compilación, algo que se logra gracias a la integración de LUA con LaTeX.

## Un plus de uso para QR

Como hemos observado, los usos para QR dentro de un libro impreso pueden extender las fronteras hoy conocidas, navegar (o consultar) parte del libro en la web es una posibilidad, por ejemplo para,

1. libros con preguntas y respuestas.
2. libros que contengan datos dinámicos (cuadros) o imágenes (en escala de gris en el impreso y a color en la web).
3. diccionarios



+++
author = "Alberto Moyano"
title= "Presentación de gbTeXpublisher"
date = 2023-11-21
description = "Presentación de gbTeXpublisher, marco teórico"
tags = ["LaTeX", "gbTeXpublisher",]
pin = true
+++

gbTeXpublisher nace como resultado de una necesidad concreta –la mía– ya que desde hace bastante tiempo adhiero a la edición ramificada y encuentro en [LaTeX](https://es.wikipedia.org/wiki/LaTeX) la vía apropiada para conseguirlo, hice intentos con markdown, asciidoc y asciidoctor, pero al final del recorrido siempre encontraba problemas, fundamentalmente en la salida a PDF, me estoy refiriendo a una salida con un alto estándar de calidad tipográfica.

<!--more-->

gbTeXpublisher es una aplicación de escritorio que permite gestionar los procesos de producción editorial de manera fácil, me gusta pensar en esta aplicación como un facilitador, ya que todo lo que se puede hacer **con** gbTeXpublisher, también se puede hacer **sin** gbTeXpublisher, la diferencia radica en la facilidad que otorga su interfaz.

gbTeXpublisher es también el resultado del enorme trabajo de muchas personas, quisiera hacer una mención de agradecimiento especial para [Donald Knuth](https://es.wikipedia.org/wiki/Donald_Knuth), [Benoît Minisini](https://en.wikipedia.org/wiki/Beno%C3%AEt_Minisini) y los foros de [CervanTeX](http://cervantex.es/) y [Gambas](https://es.wikipedia.org/wiki/Gambas), dejo para lo último a [Michal Hoftich](https://www.kodymirus.cz/), el aporte de su desarrollo a sido clave en el rumbo que tomaron mis decisiones de producción.

gbTeXpublisher posee [licencia GPL3](https://www.gnu.org/licenses/gpl-3.0.en.html), por consiguiente se concede permiso para copiar, distribuir y/o modificar este software según los términos de dicha licencia.

Este artículo es un intento de presentación formal (aunque todavía el desarrollo se encuentre en estado _beta_) y me parece oportuno comenzar con una introducción teórica sobre los modelos de producción editorial al día de hoy.

## ...

Es posible observar que la edición es íntegramente digital desde comienzo de los noventa, ya que los diferentes intervinientes en el proceso editorial, han terminado incorporando a los sistemas informáticos en su uso diario, ya sea para escribir o producción editorial, también podemos asegurar que las imprentas (por dar un ejemplo del proceso) hoy solo reciben trabajos en formato digital.

Sin embargo, se puede observar que la tradición editorial no ha podido --o sabido-- captar que este cambio en la forma de producir no refiere solo al hecho de utilizar nuevas técnicas, herramientas o dispositivos, sino también, a la pérdida de parte de los fundamentos básicos que existen en el proceso de edición.

La idea que propongo consiste en trabajar sobre un modelo de edición estandarizada, automatizada, multiformato y multisoporte (y que no atenta contra el diseño), conocida como **edición ramificada**. Para lograr esto es necesario evitar cualquier tipo de enfoque [WYSIWYG](https://es.wikipedia.org/wiki/WYSIWYG).

[Brian Kernighan](https://es.wikipedia.org/wiki/Brian_Kernighan) dijo alguna vez que el problema con el WYSIWYG (*lo que ves es lo que obtienes*) es que en realidad lo que ves es **TODO** lo que obtienes. Las interfaces gráficas son excelentes para muchas cosas, yo las utilizo de manera constante, tampoco escapo a ellas. Pero también uso la consola con un _Shell_ cuando necesito elasticidad, ya que es mucho mas práctica y potente para algunas tareas.

## Los comienzos

Podemos observar en la figura a continuación que la edición cíclica se concentra en la posibilidad de producir al mismo tiempo para varios soportes de salida (un inicio A, deriva en un destino B, C, etc.), tratando de conservar la idea de que la publicación (en nuestro caso un libro) tiene un solo camino a seguir. Este método de trabajo está arraigado en la idea de que el *software* de alguna multinacional hará el trabajo milagroso de hacerlo posible, otorgándonos tranquilidad al concebir la conversión a diferentes formatos. Solo cuando se toma conciencia *real* de la pérdida que tenemos en la calidad técnica y editorial, se hace patente que la edición cíclica no es un método óptimo para la producción multiformato y multisoporte.

![](https://albertomoyano.github.io/blog-personal/images/ciclos.png)

Pero es entendible que esto haya pasado, si observamos como era el modelo de producción editorial antes de la era digital.

![](https://albertomoyano.github.io/blog-personal/images/gutenberg.png)

## Edición ramificada

Cambiemos la perspectiva. ¿Si en lugar de concentrarnos en los diferentes formatos finales, realizamos un ejercicio de pensamiento lateral?[^1] La idea es simple: **no nos concentremos en los formatos de salida, sino en los caminos que conducen a ellos**. La conclusión se hace evidente: a múltiples caminos, múltiples formatos.

Para realizar este modelo de trabajo se utiliza un lenguaje de marcas, es la mejor forma de etiquetar un documento, ya que se pueden incorporar las marcas que contienen las indicaciones adicionales acerca de la estructura y el diseño necesarios para la representación del texto en la salida buscada.

La figura a continuación nos muestra un modelo (de todos los posibles) de edición ramificada, donde no existe una secuencia de A con B, sino un inicio de (A) con diversos caminos (B, C, D, etc.), algunos pueden frenar su andar (llegar a su destino final), otros se pueden desprender y convertirse en el inicio de otros nuevos caminos.

![](https://albertomoyano.github.io/blog-personal/images/completo.png)

Este es un posible camino, que tiene su base en el lenguaje de marcas [Markdown](https://es.wikipedia.org/wiki/Markdown), pero también existen otros lenguajes como [asciidoc](https://asciidoc-py.github.io/index.html), [Org Mode](https://orgmode.org/) y por supuesto LaTeX.

La principal consigna de este método es ir de lo simple a lo complejo. Cada formato de salida tiene sus propias necesidades particulares. Para el PDF de imprenta se requieren ajustes por cuestiones ortotipográficas y de diseño; en el ePub puede hacerse necesario configurar de otra manera las figuras o cuadros para una correcta visualización, en una lectura _on line_ se puede sacar provecho de la visualización interactiva y así un largo etcétera. Por consiguiente, lo que se hace imperioso es **evitar la herencia de características**, que es el principal problema que conlleva la metodología cíclica, a diferencia de esta, la edición ramificada se inicia con un documento simple de [texto plano](https://es.wikipedia.org/wiki/Archivo_de_texto) que **contiene solo las marcas** de los elementos estructurales (que a su vez pueden contener el diseño), para luego con ajustes automatizados obtener cada salida y que estas no tengan errores.

Ejemplo conceptual de la lógica a seguir, supongamos que tengo una marca de cita:[^cita]

1. Si la salida es a PDF se aplica «Q» diseño y valor de estructura.
2. Si la salida es a ePub se aplica «X» diseño y valor de estructura.
3. Si la salida es a XML se aplica «Y» diseño y valor de estructura.
4. Si la salida es a HTML se aplica «Z» diseño y valor de estructura.

Cada salida tiene su propia lógica para su destino, subordinada a un solo patrón de diseño estructural.

Furtado[^2] plantea que en una primera aproximación, las ediciones se diferencian entre ellas por la predominancia que tienen las actividades primarias en la transformación físico-técnica del contenido, esto implica que, desde el punto de vista de la edición, el *diseño estructural* goza de muchísimo valor.

## Algunos desarrollos que investigué

1. [Pecas](https://programando.li/bros/)

El proyecto está archivado, su desarrollador (Ramiro, alias [perro tuerto](https://git.cuates.net/perro)) en una comunicación telefónica que tuvimos hace unos años, me dijo que el proyecto tiene errores de diseño que no le permiten evolucionar, pero tal como está, si lo que se prentende es solo obtener una salida a ePub desde markdown, el software no tiene fallas, y doy fe, lo utilice para hacer ejercicios y funciona, pero tiene tanta solidez como limitaciones.

2. [Softcover](https://www.softcover.io/start)

Es básicamente un sistema de publicación, posee salida a HTML, ePub y PDF --y funciona muy bien-- lo utilicé durante un tiempo, para textos simples se puede escribir directamente en markdown (el sistema hace la conversión a LaTeX) o en su defecto en LaTeX. Está escrito en lenguaje Ruby y algunas partes del sistema son muy cerradas (en su diseño) lo cual hace muy cuesta arriba pretender hacer modificaciones al código. Pero si la matriz de producción editorial está definida y es simple, es una buena opción para trabajar.

3. [Transpect](https://transpect.github.io/)

En el sitio de Transpect se explica muy simple:

> Transspect fue diseñado para proporcionar módulos genéricos y estables para tareas comunes de conversión y verificación. Para abordar datos complejos y diversos, transspect ofrece una configuración en cascada para anular reglas específicas de transformación y verificación. Cada componente dentro del marco es de código abierto y utiliza tecnologías estándar como XSLT 2.0 y XProc.

Este proyecto es, lo más de lo más (utiliza TeX y XML como base), pero cuando intenté ponerlo en marcha me di cuenta de que solo es viable en grupos editoriales con altos volúmenes de producción, ya que su implementación no es simple, sino más bien lo contrario. Solo alcanza con ver los clientes de [le-tex](https://www.le-tex.de/en/customers.html), que son los desarrolladores, para entender esto.

4. [Orgmode](https://orgmode.org/)

Un ecosistema en si mismo...

Luego de varios intentos me dí por vencido, esta [imagen](https://i.pinimg.com/736x/11/01/3c/11013c0024bd466791a8b0489340d3d7.jpg) de _El Eternauta_, se me vino a la mente cuando escribía este artículo.

## Todos los caminos conducen a LaTeX

Conocí LaTeX en el año 1993, de la mano de Horacio Suárez, recién llegado de México venía de trabajar en una editorial orientada a las matemáticas, me lo mostro en una máquina corriendo [MS-DOS](https://es.wikipedia.org/wiki/MS-DOS) y ejecutando el editor [epsilon](https://lugaru.com/), me sorprendió mucho, pero no fue hasta 10 años después, cuando abandone la preprensa y la imprenta para dedicarme de lleno a la edición que le empecé a dar un uso intenso.

Esto no impide que en los últimos años también haya trabajado con [Markdown](https://es.wikipedia.org/wiki/Markdown) y [AsciiDoc](https://en.wikipedia.org/wiki/AsciiDoc) (con el intérprete [asciidoctor](https://asciidoctor.org/)), y aún hoy los sigo usando (los artículos de este blog los escribo en markdown).

### Botones para muestra

Para poder graficar mejor lo dicho en el párrafo anterior, dejo muestras de características obtenidas en mi trabajo diario con LaTeX, que son imposibles de obtener con otros lenguajes (o con programas para DTP del mercado) que explican mejor a que me refiero cuando utilizo la expresión **alta calidad tipográfica**.

### Homeoarchy

Control de inconsistencia de principio y fin de linea.

![](https://albertomoyano.github.io/blog-personal/images/home.png)

### Formateo automático ortotipográfico

Se puede observar que la tabla de la base de datos, no contiene bastardillas, ni puntos, ni versalitas, etc.

{{< highlight tex >}}
@Book{Mazlish1995,
  hyphenation  = {spanish},
  author       = {Mazlish, Bruce},
  date         = {1995},
  keywords     = {listar},
  location     = {Madrid},
  publisher    = {Alianza Editorial},
  title        = {La cuarta discontinuidad},
}
{{< /highlight >}}

Y esta es la salida que se obtiene en el PDF.

![](https://albertomoyano.github.io/blog-personal/images/mazlish.png)

### Posición de los objetos en la página

Se tiene control absoluto sobre cualquier posición _x-y_ de la página para posicionar objetos, incluso otra página (que también se interpreta como un objeto).

![](https://albertomoyano.github.io/blog-personal/images/objeto.png)

Estos ejemplos son solo la punta del iceberg, puede sonar exagerado, pero se entiende mejor cuando se asimila a LaTeX como lo que es, _un lenguaje de programación para la composición tipográfica_, y **no** como un programa de armado.

## Pequeña radiografía de LaTeX

LaTeX es un sistema de composición tipográfica, orientado a la creación de documentos escritos con una alta calidad tipográfica. Por sus características y posibilidades, es usado de manera intensiva en la generación de textos científicos. Fue escrito por [Leslie Lamport](https://es.wikipedia.org/wiki/Leslie_Lamport) en 1984, con la intención de facilitar el uso del lenguaje de composición tipográfica [TeX](https://es.wikipedia.org/wiki/TeX), creado por [Donald Knuth](https://es.wikipedia.org/wiki/Donald_Knuth). A resumidas cuentas, LaTeX es un conjunto de macros de TeX, y se encuentra bajo [licencia LPPL](https://es.wikipedia.org/wiki/LaTeX_Project_Public_License).

Los archivos de LaTeX presentan una primera división de dos partes:

1. Preámbulo (documentclass)
2. Documento (document)

Podemos decir que los archivos son la suma del contenido en texto plano, más intrucciones y marcas, también en texto plano.

{{< highlight tex >}}
\documentclass{book}% acá comienza el preámbulo

% carga de paquetes y funciones

\begin{document}% acá comienza en documento

% contenido y funciones

\end{document}
{{< /highlight >}}

A su vez, la segunda parte (document), también tiene divisiones internas.

1. Frontmatter
2. Mainmatter
3. Appendix
4. Backmatter

{{< highlight tex >}}

...

\begin{document}% acá comienza en documento
\frontmatter

% en el mundo editorial este espacio también es conocido como «primeras».

\mainmatter

% cuerpo principal del texto

\appendix

% apéndices

\backmatter

% listado de índices

\end{document}
{{< /highlight >}}

Este artículo no es un curso de LaTeX, en la red hay a montones, pero con esta aclaración particular se va a entender como trabaja gbTeXpublisher.

## ¿Entonces?

DESARROLLAR

![](https://albertomoyano.github.io/blog-personal/images/archivo.png)

La figura a continuación muestra un resumen de cómo es el flujo de trabajo, es importante resaltar la posibilidad que existe de recuperar cualquier trabajo antiguo, indistintamente del formato que tenga.

![](https://albertomoyano.github.io/blog-personal/images/literada.png)

## Gambas

No soy programador, me identifico plenamente como editor con una fuerte formación en artes gráficas (tuve taller de preprensa e imprenta durante muchos años), así que mis conocimientos son en base a mucha lectura y práctica. Estuve durante mucho tiempo lidiando con [Python](https://es.wikipedia.org/wiki/Python), Objet Pascal [(Lazarus)](https://es.wikipedia.org/wiki/Lazarus_(entorno_de_desarrollo)) y algo de [Ruby](https://es.wikipedia.org/wiki/Ruby), y reconozco ventajas en todos estos lenguajes, pero mi reflexión en la búsqueda de una solución informática consideró primordialmente el balance entre: calidad, desempeño, facilidad de uso y productividad, el resultado me llevo a encarar gbTeXpublisher con [Gambas](https://gambas.sourceforge.net/en/main.html).

> Gambas es un lenguaje de programación libre derivado de BASIC (de ahí que Gambas quiere decir **G**ambas **A**lmost **M**eans **Bas**ic). Se distribuye con licencia GNU GPL. Cabe destacar que presenta ciertas similitudes con Java, ya que para la ejecución de cualquier aplicación, se requiere un intérprete previamente instalado (Gambas Runtime) que entienda el bytecode de las aplicaciones desarrolladas y lo convierta en código ejecutable por el computador [(wikipedia)](https://es.wikipedia.org/wiki/Gambas).

![](https://albertomoyano.github.io/blog-personal/images/pantalla10.png)

Y si bien los motivos en mi elección son varios, también entiendo que puedan ser cuestionados, dejo aquí cuáles fueron los más importantes para mi elección:

1. No programo para terceros, lo hago para mí uso personal.
2. Utilizo Linux (desde hace 30 años, desde 1993) en el 90% de mis tareas, y me siento muy cómodo con el entorno de trabajo.
3. No soy fanático del 100% comandos, ni del 100% mouse, creo en un equilibrio que saque lo mejor de cada modelo, según la necesidad.
4. Gambas es un [RAD](https://es.wikipedia.org/wiki/Desarrollo_r%C3%A1pido_de_aplicaciones).
5. Es muy rápido y potente [(Benchmarks)](https://gambas.sourceforge.net/en/main.html#).

## Algunas aclaraciones sobre Linux

Por motivos que superan las expectativas de este artículo y sabiendo que todas las distribuciones de GNU Linux tienen diferencias en las librerías gráficas, voy a mostrar cual es el equipo con el que desarrollo y trabajo a diario utilizando gbTeXpublisher, cualquier persona que este intentando utilizar la aplicación y tenga diferencias en la distribución de los elementos de la interfaz gráfica, me puede contactar indicando que distribución utiliza, con cuál librería gráfica y entorno de escritorio y veré de hacer pruebas de control.

![](https://albertomoyano.github.io/blog-personal/images/manjaro.png)

## Descarga e instalación de gbTeXpublisher

El programa tiene dependencia de [Git](https://git-scm.com/), Pandoc y [Sigil](https://sigil-ebook.com/sigil/), doy por descartado que LaTeX ya está instalado, sugiero tener instalada la versión _full_ (aproximadamente 4 gigas).

También es necesario tener una cuenta en [gitlab](https://gitlab.com/), la versión gratuita es más que suficiente.

Si bien en gambas se puede hacer el empaquetado para las principales distribuciones de GNU Linux, para evitar posibles conflictos, lo que está disponible es un empaquetado **autotools**.

El video del siguiente enlace explica el procedimiento de uso [(ver video)](https://www.dropbox.com/scl/fi/atk3ply6qro7ndo17zed3/gbTeXpublisher-0.0.431.tar.gz?rlkey=u26d712eg85tpmpptbr5yim31&dl=1).

Este es el _link_ de descarga para la última versión disponible [(gbTeXpublisher v431)](https://www.dropbox.com/scl/fi/atk3ply6qro7ndo17zed3/gbTeXpublisher-0.0.431.tar.gz?rlkey=u26d712eg85tpmpptbr5yim31&dl=1).

Para los que quieran hacer una bifurcación del proyecto, este es la ruta de [gbTeXpublisher](https://gitlab.com/alberto.alejandro.moyano/gbtexpublisher) para compilar desde las fuentes.

Los usuarios de windows pueden utilizar el software con [WSL](https://learn.microsoft.com/es-es/windows/wsl/install).

## Comenzando con gbTeXpublisher

Cuando se está editando un solo libro, se pueden tener ciertas libertades, pero cuando se tienen 7 o 9 libros de manera constante en el flujo de producción, la cosa cambia. El orden y el principio de [DRY](https://es.wikipedia.org/wiki/No_te_repitas) se vuelve más que importante si queremos tener una sana optimización de los recursos. En gbTeXpublisher se van a encontar funciones predefinidas (y rígidas) que aseguran comportamientos estables y predecibles.

Luego de instalar gbTeXpublisher encontraremos una carpeta oculta dentro del **`home.user`** (léase carpeta personal), donde se alojara la base de datos, el proceso de instalación copia una base de datos con un número determinado de entradas que sirven como ejemplo, esto vale para las notas y las referencias bibliográficas. En la figura a continuación lo resalto con una línea roja.

![](https://albertomoyano.github.io/blog-personal/images/pantalla11.png)

El programa no trabaja **sobre** el archivo de LaTeX, sino que lo hace con una **copia**. Esto da plena y absoluta libertad de trabajar el texto con el editor que mejor le plazca al usuario. De ahí que su interfaz de incio pueda sorprender --ya que no dice nada-- esto también se observa al notar que algunos menúes están deshabilitados y se activan una vez que se haya elegido un archivo con el cual trabajar. La imagen a continuación lo ilustra.

![](https://albertomoyano.github.io/blog-personal/images/pantalla01.png)

Una vez que hayamos seleccionado un archivo para trabajar, la pantalla puede parecerse a esta.

![](https://albertomoyano.github.io/blog-personal/images/pantalla02.png)

Volviendo al inicio, en un párrafo anterior dije que algunos menúes están deshabilitados hasta que se elija un archivo **`.tex`** para trabajar, pero otros sí están habilitados.

El primero que encontramos es el formulario para la conversión de archivos word (**`.docx`**) a formato **`.tex`**, el proceso se realiza utilizando [pandoc](https://pandoc.org/), junto con la conversión se realizan otras dos tareas más: 1) se crean dos carpetas --originales y media-- dentro del directorio de trabajo y 2) se mueve el archivo word a la carpeta originales.

![](https://albertomoyano.github.io/blog-personal/images/pantalla06.png)

El segundo es el formulario de apuntes, su idea y desarrollo surgieron de manera natural. Antes de gbTeXpublisher, a medida que iba trabajando tomaba apuntes sobre el proceso, ya sea consultas que debía hacer, buscar en otros archivos ese pedazo de código que alguna vez use o simplemente apuntes de ayuda memoria temporal, todo eso es lo que se vuelca en este formulario, la información queda almacenada en la base de datos para ser recuperada cada vez que sea necesario.

![](https://albertomoyano.github.io/blog-personal/images/pantalla08.png)

## Configurando las salidas

Existen 4 archivos de configuración, el programa instala una configuración base que sirve para una gran  mayoría de casos, en estos archivos es en donde se hacen cambios cuando se pretende alterar la salida más allá del diseño visual.

![](https://albertomoyano.github.io/blog-personal/images/build.png)

![](https://albertomoyano.github.io/blog-personal/images/configepub.png)

## Ahora bien, comenzamos con el trabajo

Luego de seleccionar un archivo, si miramos la carpeta contenedora del proyecto, veremos que se han creado nuevos directorios:

1. catalogo
2. correcciones
3. files
4. media
5. originales
6. tapa

Si los directorios **originales** y **media**, ya existian porque se hizo la conversión de **`.docx`** a **`.tex`** utilizando gbTeXpublisher, estos no se sobreescriben y se mantiene sin modificaciones su contenido.

![](https://albertomoyano.github.io/blog-personal/images/sample.png)

Dentro del directorio **files** se agregaran los archivos auxiliares y complementarios para la compilación, estos son los diferentes preámbulos y archivos de configuración, si cualquiera de estos archivos fuera modificado (no importa si desde gbTeXpublisher o desde un editor externo), no será reemplazado al volver (en un momento diferente) a cargar la aplicación, solo será agregado nuevamente aquél archivo que por error hubiera sido eliminado.

![](https://albertomoyano.github.io/blog-personal/images/sample2.png)

## Referencias bibliográficas

A continuación vemos el formulario para manejar las referencias bibliográficas, el programa trabaja con la base de datos [SQLite](https://es.wikipedia.org/wiki/SQLite), que para trabajar de manera individual, es lo mejor que conozco, pero si el trabajo se quisiera realizar en modo colaborativo (en red, abierta o cerrada), debería migrar a otro motor (analizo [MaríaDB](https://es.wikipedia.org/wiki/MariaDB) como opción).

Todas las entradas están basadas en [BibLaTeX](https://www.ctan.org/pkg/biblatex) que es una reimplementación completa de las funciones bibliográficas proporcionadas por LaTeX. El formato está completamente controlado por macros de LaTeX. BibLaTeX utiliza su propio analizador de datos llamado [biber](https://biblatex-biber.sourceforge.net/) (escrito en [Perl](https://es.wikipedia.org/wiki/Perl)) para procesar los datos bibliográficos.

Por _default_ gbTeXpublisher para la clase _book_ entrega un archivo configurado para la salida a PDF con el diseño autor-año desarrollado por Ivan Valbusa ([biblatex-philosophy](https://ctan.org/pkg/biblatex-philosophy)) y el estándar autor-año de bibLaTeX para el resto de las salidas, para la clase _article_ entrega un archivo con el diseño autor-año de [biblatex-APA](https://www.ctan.org/pkg/biblatex-apa) y, por supuesto, todas estas salidas son modificables.

![](https://albertomoyano.github.io/blog-personal/images/pantalla07.png)

## Metadatos

La información contenida en el formulario de metadatos es utilizada en las diferentes salidas, a la derecha los íconos muestran en que salida impacta esa información.

![](https://albertomoyano.github.io/blog-personal/images/metadatos.png)

Los metadatos específicos de los autores y las colecciones se trabajan desde otras tablas de la base de datos para evitar la redundancia.

![](https://albertomoyano.github.io/blog-personal/images/autores.png)

![](https://albertomoyano.github.io/blog-personal/images/coleccion.png)

## Siglas y glosarios

Las siglas y glosarios se pueden dar de alta desde este formulario, lo que implica que quedan registrados en la base de datos, esto permite la reutilización de los valores, también es posible agregar entradas directamente en el archivo **`.tex`**.

![](https://albertomoyano.github.io/blog-personal/images/glosarios.png)

## Catálogo automatizado

Una de las cuestiones que necesitaba resolver de manera automatizada, era el catálogo en formato PDF, hasta la versión actual la construcción se hace con una plantilla fija, los datos se toman de los metadatos y solo quedan unos pocos datos para agregar manualmente, en un futuro espero agregar plantillas para disponer de diferentes diseños.

El PDF que obtengo lo llevo a un directorio en donde se encuentran todas las páginas de los diferentes libros y un _script_ hace el trabajo de _costura_ sumando todos los archivos más una tapa en un solo archivo resultante.

![](https://albertomoyano.github.io/blog-personal/images/catalogo.png)

## Estadísticas

![](https://albertomoyano.github.io/blog-personal/images/estadisticas.png)

## Logfile

![](https://albertomoyano.github.io/blog-personal/images/logfile.png)

## Git local y remoto como copia de seguridad temporal

[GitLab](https://es.wikipedia.org/wiki/GitLab)

![](https://albertomoyano.github.io/blog-personal/images/pantalla14.png)

![](https://albertomoyano.github.io/blog-personal/images/pantalla15.png)

## El trabajo en equipo

> Kanban, cuyo significado es letrero o tarjeta en japonés,​ es un sistema de información que controla de modo armónico la fabricación de los productos necesarios en la cantidad y tiempo necesarios en cada uno de los procesos que tienen lugar tanto en el interior de la fábrica, como entre distintas empresas [(Wikipedia)](https://es.wikipedia.org/wiki/Kanban).

Kanban en GitLab

![](https://albertomoyano.github.io/blog-personal/images/kanban.png)

## Copia de seguridad del trabajo terminado

Llegado a este punto, el trabajo está terminado, el libro impreso, la versión electrónica subida al repositorio, etcétera. Ha llegado el momento de guardar todo en un depósito de respaldo, yo personalmente utilizo [Mega](https://es.wikipedia.org/wiki/Mega_(sitio_web)), su relación costo/beneficio para este menester es la mejor (hay más opciones, por supuesto), también tengo un abono en Google para expandir mi cuota en Drive, pero lo utilizo para otras cosas. El menú **Comprimir directorio para respaldo**, básicamente lo que hace es una copia comprimiendo todo en formato [**`.tar.gz`**](https://es.wikipedia.org/wiki/Tar), la imagen a continuación lo dice todo. Después solo resta llevar ese archivo al repositorio de respaldo.

![](https://albertomoyano.github.io/blog-personal/images/pantalla17.png)

## Veamos todo esto en un video


## Comentario final

La edición científica necesita una transformación --esencialmente enriquecedora-- sobre su modelo de producción, a efectos de poder garantizar --sin fechas de vencimiento-- su capacidad de poder mantenerse en el tiempo asegurando el procesamiento y la difusión de sus contenidos. El método elegido para la edición científica, es en gran medida responsable de la calidad de las fuentes de información que produce. Los variados saberes involucrados, le otorgan a esta profesión un desempeño interdisciplinario complejo dentro del campo de la producción del conocimiento.

Matthew Carter en una exposición en el 2014 lo planteó en términos muy simples:

> La pregunta es, ¿una restricción obliga a un compromiso? Aceptando una restricción, ¿estás trabajando a un nivel inferior? (...). La distinción entre una restricción y un compromiso es, obviamente, muy sutil, pero es muy central en mi actitud hacia el trabajo (min. 4:57).

{{< youtube xjxyEwjG2Es >}}

[^1]: De Bono, Edward (1967). [*New Think: The Use of Lateral thinking*](https://books.google.com.ar/books/about/El_pensamiento_lateral_pr%C3%A1ctico.html?id=ir_PDOmfHBwC&printsec=frontcover&source=kp_read_button&hl=es-419&redir_esc=y#v=onepage&q&f=false), Avon Books.

[^2]: Furtado, José Afonso (2014). [*La edición de libros y la gestión estratégica*](https://www.eduvim.com.ar/libro/9789876991735-la-edicion-de-libros-y-la-gestion-estrategica), Córdoba: EDUVIM.

[^cita]: Puede ser cualquier valor de la estructura: título, referencia, fórmula, etcétera.

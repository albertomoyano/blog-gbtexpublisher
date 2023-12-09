+++
author = "Alberto Moyano"
title= "Homeoarchy, «esa te la debo»"
date= "2021-02-05"
description = "Control de inconsistencias en principio y fin de línea"
tags = [
    "LaTeX",
    "ortotipografía",
]
+++

En un listado de los diferentes momentos que existen durante el proceso de edición de un libro –a mi juicio– la corrección (en todas sus etapas) está entre los más importantes, son muchas las editoriales que pueden mandar a imprimir un libro, incluso son muchas más las que simplemente «ensucian papel», pero realmente son pocas las que editan y publican con extremos cuidados y de manera profesional.

El rubro editorial no escapa de la pelea –paradigma del desarrollo capitalista– por mantener y, en el mejor de las casos, intentar aumentar su tasa de ganancia, la idea de la edición romántica solo vale para quienes editan por hobby (dicho de otra manera, no viven de lo que obtienen como renta por editar), en muchos casos el mantenimiento de esta tasa se obtiene a través de la eliminación de procesos de control, una baja en la calidad de los materiales utilizados y, en el peor de los mundos, mentir, lisa y llanamente, esto es, decir asegurar hacer cosas que en realidad no se hacen.

La corrección es uno de los procesos de edición que viene sufriendo desde hace años una baja en su calidad, ya sea porque se ha perdido la especificidad (correctores preparados especialmente para temas específicos) o porque hay una crisis de mercado en la relación oferta/demanda que permite que correctores con menos experiencia tomen trabajos que requieren de mayor conocimiento, por nombrar las dos más comunes de encontrar.

Ahora bien, existe una linea de trabajo en la cual el desarrollo de métodos y procedimientos están cada vez más ligados al avance tecnológico, el control del _homeoarchy_ (omisión accidental de una línea de texto durante la lectura, debido a similitudes en su contenido inicial) es un ejemplo. En LaTeX se pueden utilizar las macros que desarrolló [Raphaël Pinson](https://raphink.info/) utilizando el lenguaje Lua, estas hacen los controles para este tipo de errores, todas las opciones disponibles están explicadas en su [manual de uso](https://www.ctan.org/tex-archive/macros/latex/contrib/impnattypo).

    \usepackage[hyphenation,
    homeoarchy,
    homeoarchywordcolor=yellow,
    homeoarchycharcolor=orange,
    draft]{impnattypo}

Una de las recomendaciones que propongo para solucionar este tipo de inconsistencias es reescribir parte del pasaje en cuestión, asumiendo que es posible hacerlo. Si el pasaje es una cita textual no se debe cambiar ni una una sola palabra. A continuación muestro ejemplos «de la vida real», se pueden observar 3 figuras tomadas de 2 libros editados recientemente, en la primer parte de cada figura están las marcas de color con el error y a continuación el pasaje corregido, preferí no marcar los cambios para que con la lectura los encuentren.

### Figura 1

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/fig1-1.png)

### Figura 2

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/fig1-2.png)

### Figura 3

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/fig1-3.png)

En el ejemplo anterior vemos un detalle que es motivo obligado para otra entrada, se puede observar que aún comenzando de igual manera la primer linea, su final es diferente, esto se debe a que el motor de TeX procesa los cálculos tipográficos con 4 dígitos decimales (0,0001), a diferencia de los programas convencionales que trabajan solo con 2 (0,01), esto da una mayor flexibilidad y precisión en el uso del rango predefinido (dentro de la tipografía) de tolerancia al cálculo tipográfico en la construcción de las lineas y/o párrafos, pudiendo obtenerse situaciones como la mostrada en la figura, donde las alteraciones del [_kerning_](http://www.texnia.com/kern.html) de la tipografía y su tratamiento [microtipográfico](https://tex.stackexchange.com/questions/1319/showcase-of-beautiful-typography-done-in-tex-friends) no son perceptibles al ojo humano.



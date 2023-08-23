+++
author = "Alberto Moyano"
title= "Consultas a la RAE"
date= "2021-12-27"
description = "Consultas en paralelo a 2 diccionarios de la RAE"
tags = [
    "gambas",
    "programación",
]
categories = [
    "lenguajes",
]
+++

En el trabajo consulto de manera permanente a varios diccionarios en linea, el de la RAE y el DPD (también de la RAE) son 2 de ellos, estar cambiando de pestañas dentro del navegador (además de obligarme a tenerlo abierto) en algún momento se volvió molesto, así que decidí hacerme una pequeña aplicación para hacer las consultas en simultáneo a ambos diccionarios sin tener que recurrir a ningún navegador en particular. Inicialmente lo iba a escribir en Python pero el manejo de [PyQT](https://es.wikipedia.org/wiki/PyQt) sigue sin agradarme, así que lo hice con [Gambas](https://es.wikipedia.org/wiki/Gambas), este [RAD](https://es.wikipedia.org/wiki/Desarrollo_r%C3%A1pido_de_aplicaciones) está ninguneado dentro del mundo de la programación, pero yo he visto trabajos increíbles.

El programa ocupa tan solo 18 líneas de código, las dejo a continuación, la interfaz tiene 1 textbox, 1 botón y 2 webview, eso es todo.

    Public Sub Form_Open()
        txtRAE.SetFocus()
        HSplit1.Layout = [1, 1]
    End

    Public Sub btnRAE_Click()
        Dim Buscar As String
        Buscar = txtRAE.Text
        wwwRAE.Url = "https://dle.rae.es/" & Buscar
        wwwRAE1.Url = "https://www.rae.es/dpd/" & Buscar
    End

    Public Sub txtRAE_KeyRelease()
    If Key.code = Key.enter Or Key.code = Key.return Then
        btnRAE_Click()
    Endif
    End

    Public Sub HSplit1_Resize()
        HSplit1.Layout = [1, 1]
    End

![](https://albertomoyano.github.io/blog-gbtexpublisher/images/rae.png)


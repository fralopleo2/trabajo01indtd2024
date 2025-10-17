# 💻 trabajo01indtd2024: Métodos de Decisión bajo Incertidumbre

## Descripción del Proyecto Individual

Este repositorio contiene la resolución del primer trabajo individual de la asignatura de Teoría de la Decisión (2025), centrado en la aplicación práctica de los **métodos de decisión bajo incertidumbre** mediante el lenguaje de programación R y RStudio.

El trabajo incluye la creación y resolución de dos problemas inventados, tal como se especifica en el detalle de la tarea.

---

## Contenido del Repositorio

| Archivo | Contenido |
| :--- | :--- |
| **Enunciados de los Problemas de Teoría de la Decisión bajo Incertidumbre** | Documento que contiene exclusivamente el enunciado completo de los dos problemas inventados (Problema 1 y Problema 2). |
| **Trabajo1.R** | Script de R que contiene: <ul><li>La matriz de decisión y el código R para la **resolución completa** de los dos problemas.</li><li>Los enunciados de los problemas incluidos como comentarios.</li><li>La **conclusión** clara de la decisión óptima al final de cada resolución.</li></ul> |
| **teoriadecision\_funciones\_incertidumbre.R** | Archivo de funciones R proporcionado por la asignatura, necesario para ejecutar los diferentes criterios de incertidumbre. |
| **README.md** | Este documento. |

---

## Problemas Resueltos

El script resuelve dos escenarios de toma de decisiones bajo incertidumbre:

1.  **Problema 1: Inversión en Start-up de Tecnología**
    * **Tipo:** Tabla de decisión con valores inventados (beneficios/costes).
    * **Resolución:** Se utiliza cada función de incertidumbre individualmente (Wald, Optimista, Hurwicz, Savage, Laplace, Punto Ideal), tanto en situación favorable como desfavorable.

2.  **Problema 2: Lanzamiento de un Nuevo Producto**
    * **Tipo:** Situación real con cuota de mercado esperada (favorable).
    * **Resolución:** Se utiliza la función consolidada `criterio.Todos` para obtener la decisión final por consenso.

---

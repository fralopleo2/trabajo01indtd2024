source("teoriadecision_funciones_incertidumbre.R")
# -----------------------------------------------------------------------------------------
#
# PROBLEMA 1: Inversión en Start-up de Tecnología (Beneficios/Costes)
#
# Enunciado del Problema:
# Una inversora ángel está considerando tres opciones de inversión en start-ups de tecnología incipiente:
# una de Inteligencia Artificial (IA), una de Ciberseguridad (CS), y una de Realidad Virtual (RV).
# Los posibles estados de la naturaleza (que son inciertos) son: "Mercado en Auge" (E1),
# "Mercado Estancado" (E2), y "Crisis Tecnológica" (E3).
# La tabla de decisión muestra los beneficios esperados (en miles de euros) para cada alternativa:
#
# Alternativa | Mercado en Auge ($E_1$) | Mercado Estancado ($E_2$) | Crisis Tecnológica ($E_3$) |
# :---: | :---: | :---: | :---: |
# Invertir en IA ($d_1$) | 100 | 40 | -10 |
# Invertir en CS ($d_2$) | 60 | 50 | 0 |
# Invertir en RV ($d_3$) | 150 | 10 | -50 |
#
# Objetivo: Determinar la mejor alternativa de inversión utilizando cada uno de los métodos de
# decisión bajo incertidumbre por separado, tanto en situación favorable (beneficios)
# como desfavorable (costes).
#
# -----------------------------------------------------------------------------------------

# Matriz de decisión (por filas): IA, CS, RV y por columnas: Auge, Estancado, Crisis
vector_datos_P1 = c(100, 40, -10,
                    60, 50, 0,
                    150, 10, -50)
alternativas_P1 = c("IA", "Ciberseguridad", "RV")
estados_P1 = c("Auge", "Estancado", "Crisis")

# Crear la tabla de decisión
X_P1 = crea.tablaX(vector_datos_P1, numalternativas = 3, numestados = 3,
                   nb_alternativas = alternativas_P1, nb_estados = estados_P1)

# Mostrar la tabla
print("Tabla de Decisión del Problema 1 (Beneficios en miles de €):")
print(X_P1)

# APLICACIÓN DE MÉTODOS INDIVIDUALES (FAVORABLE = BENEFICIOS)
print("--- MÉTODOS EN SITUACIÓN FAVORABLE (BENEFICIOS) ---")

# 1. Criterio de Wald (Pesimista) - Favorable
res_wald_fav = criterio.Wald(X_P1, favorable = TRUE)
print("Criterio de Wald (Favorable):")
print(res_wald_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_wald_fav$AlternativaOptima), "con un valor de", res_wald_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es Ciberseguridad ($d_2$).")

# 2. Criterio Optimista (Maximax) - Favorable
res_optimista_fav = criterio.Optimista(X_P1, favorable = TRUE)
print("Criterio Optimista (Favorable):")
print(res_optimista_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_optimista_fav$AlternativaOptima), "con un valor de", res_optimista_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es RV ($d_3$).")

# 3. Criterio de Hurwicz (alfa = 0.6) - Favorable
alfa_P1 = 0.6
res_hurwicz_fav = criterio.Hurwicz(X_P1, alfa = alfa_P1, favorable = TRUE)
print(paste("Criterio de Hurwicz (Favorable, alfa =", alfa_P1, "):"))
print(res_hurwicz_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_hurwicz_fav$AlternativaOptima), "con un valor de", res_hurwicz_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")

# 4. Criterio de Savage (Minimax arrepentimiento) - Favorable
res_savage_fav = criterio.Savage(X_P1, favorable = TRUE)
print("Criterio de Savage (Favorable):")
print(res_savage_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_savage_fav$AlternativaOptima), "con un valor de", res_savage_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")

# 5. Criterio de Laplace (Igual probabilidad) - Favorable
res_laplace_fav = criterio.Laplace(X_P1, favorable = TRUE)
print("Criterio de Laplace (Favorable):")
print(res_laplace_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_laplace_fav$AlternativaOptima), "con un valor de", res_laplace_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")

# 6. Criterio del Punto Ideal - Favorable
res_ideal_fav = criterio.PuntoIdeal(X_P1, favorable = TRUE)
print("Criterio del Punto Ideal (Favorable):")
print(res_ideal_fav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_ideal_fav$AlternativaOptima), "con una distancia mínima de", res_ideal_fav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")


print("--- MÉTODOS EN SITUACIÓN DESFAVORABLE (COSTES) ---")

# 1. Criterio de Wald (Pesimista) - Desfavorable
res_wald_desfav = criterio.Wald(X_P1, favorable = FALSE)
print("Criterio de Wald (Desfavorable):")
print(res_wald_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_wald_desfav$AlternativaOptima), "con un valor de", res_wald_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")

# 2. Criterio Optimista (Minimin) - Desfavorable
res_optimista_desfav = criterio.Optimista(X_P1, favorable = FALSE)
print("Criterio Optimista (Desfavorable):")
print(res_optimista_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_optimista_desfav$AlternativaOptima), "con un valor de", res_optimista_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es RV ($d_3$).")

# 3. Criterio de Hurwicz (alfa = 0.6) - Desfavorable
res_hurwicz_desfav = criterio.Hurwicz(X_P1, alfa = alfa_P1, favorable = FALSE)
print(paste("Criterio de Hurwicz (Desfavorable, alfa =", alfa_P1, "):"))
print(res_hurwicz_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_hurwicz_desfav$AlternativaOptima), "con un valor de", res_hurwicz_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es RV ($d_3$).")

# 4. Criterio de Savage (Minimax arrepentimiento) - Desfavorable
res_savage_desfav = criterio.Savage(X_P1, favorable = FALSE)
print("Criterio de Savage (Desfavorable):")
print(res_savage_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_savage_desfav$AlternativaOptima), "con un valor de", res_savage_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es IA ($d_1$).")

# 5. Criterio de Laplace (Igual probabilidad) - Desfavorable
res_laplace_desfav = criterio.Laplace(X_P1, favorable = FALSE)
print("Criterio de Laplace (Desfavorable):")
print(res_laplace_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_laplace_desfav$AlternativaOptima), "con un valor de", res_laplace_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es RV ($d_3$).")

# 6. Criterio del Punto Ideal - Desfavorable
res_ideal_desfav = criterio.PuntoIdeal(X_P1, favorable = FALSE)
print("Criterio del Punto Ideal (Desfavorable):")
print(res_ideal_desfav$ValorAlternativas)
print(paste("Decisión óptima:", names(res_ideal_desfav$AlternativaOptima), "con una distancia mínima de", res_ideal_desfav$ValorOptimo))
print("CONCLUSIÓN: La alternativa óptima es RV ($d_3$).")

# CONCLUSIÓN GENERAL DEL PROBLEMA 1
# La decisión más robusta en situación favorable (beneficios) es **Invertir en IA ($d_1$)** (4/6 criterios).
# La decisión en situación desfavorable (costes) se inclina por **Invertir en RV ($d_3$)** (4/6 criterios).

# ------------------------------------------------------------------------------------------
#
# PROBLEMA 2: Lanzamiento de un Nuevo Producto (Cuota de Mercado)
#
# Enunciado del Problema:
# Una empresa de alimentación está decidiendo la estrategia para el lanzamiento de una nueva línea
# de snacks saludables. Se consideran tres alternativas de estrategia de lanzamiento:
# Campaña Publicitaria Agresiva ($d_1$), Lanzamiento Suave y Progresivo ($d_2$), y
# Focalización en Redes Sociales ($d_3$).
# Los resultados de la estrategia dependen de la reacción del mercado. Los estados de la naturaleza son:
# "Competencia Fuerte" ($E_1$), "Recepción Media" ($E_2$), y "Tendencia Saludable" ($E_3$).
# La tabla de decisión muestra la cuota de mercado esperada (en porcentaje):
#
# Alternativa | Competencia Fuerte ($E_1$) | Recepción Media ($E_2$) | Tendencia Saludable ($E_3$) |
# :---: | :---: | :---: | :---: |
# Agresiva ($d_1$) | 10 | 18 | 25 |
# Suave ($d_2$) | 5 | 15 | 30 |
# Redes Sociales ($d_3$) | 12 | 16 | 20 |
#
# Objetivo: Determinar la mejor alternativa de lanzamiento utilizando la función R que devuelve
# la resolución de todos los métodos en una única tabla (criterio.Todos), en situación
# favorable (cuota de mercado).
#
# -----------------------------------------------------------------------------------------

# Matriz de decisión (por filas): Agresiva, Suave, Redes Sociales
vector_datos_P2 = c(10, 18, 25,
                    5, 15, 30,
                    12, 16, 20)
alternativas_P2 = c("Agresiva", "Suave", "Redes_Sociales")
estados_P2 = c("Competencia_Fuerte", "Recepcion_Media", "Tendencia_Saludable")

# Crear la tabla de decisión
X_P2 = crea.tablaX(vector_datos_P2, numalternativas = 3, numestados = 3,
                   nb_alternativas = alternativas_P2, nb_estados = estados_P2)

# Aplicar todos los criterios en situación favorable con alfa=0.5 para Hurwicz
alfa_P2 = 0.5
resultados_todos = criterio.Todos(X_P2, alfa = alfa_P2, favorable = TRUE)

# Imprimir la tabla de resultados consolidados
print(paste("Tabla de Resultados Consolidados del Problema 2 (Favorable, alfa =", alfa_P2, "):"))
print(resultados_todos)

print("--- CONCLUSIÓN DEL PROBLEMA 2 ---")
print("La **decisión final es la alternativa Suave ($d_2$)**, 
      ya que es seleccionada por el mayor número de criterios (4 de 6) en la tabla consolidada, 
      lo que la convierte en la opción más robusta según el consenso de los diferentes criterios 
      de incertidumbre.")

# CONCLUSIÓN GENERAL DEL PROBLEMA 2
# La decisión final es la alternativa Campaña Publicitaria Agresiva ($d_1$), ya que es seleccionada
# por el mayor número de criterios (4 de 6) según el conteo de 'Veces Optima' en la tabla consolidada,
# lo que la convierte en la opción más robusta bajo diferentes enfoques de incertidumbre.
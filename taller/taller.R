# =====================================================================
#  Taller de investigacion cuantitativa — FA 57 La Libertad, Trujillo
#  Viernes 21 de agosto de 2026
#
#  Todo lo que sigue usa SOLO R basico: no hace falta instalar ningun
#  paquete adicional. Ejecuta cada linea con Ctrl + Enter.
# =====================================================================


# ---- 1. Leer los datos ----------------------------------------------

# sep = ";" porque asi es como Kobo separa las columnas. Miralo tu mismo:
# abre el CSV en un editor de texto y fijate en que hay entre un dato y el
# siguiente. Si te equivocas de separador, R carga UNA sola columna ancha.
#
# Hay tres maneras de traer los datos. Se usa UNA: la que quieras, quitandole
# el # a su linea y poniendoselo a las otras. Las tres leen las mismas
# columnas, asi que todo lo que viene despues funciona igual.
#
# >>> Por defecto esta activa la opcion C (datos de ejemplo), que funciona
#     siempre. EL DIA DEL TALLER hay que activar la B. <<<
# La opcion A es la que vas a usar en casa, con tu propia encuesta.


# Opcion A — un archivo CSV que ya esta en esta computadora.
#
# ESTA ES LA QUE VAS A USAR CON TU PROPIA ENCUESTA: primero se descarga
# (en Kobo: DATOS > Descargas > CSV > Valores y encabezados XML > Exportar,
# y despues el boton Descargar) y luego se abre aqui.
#
# file.choose() abre el buscador de archivos: haces clic en el CSV y ya. No
# hace falta escribir ninguna ruta ni saber en que carpeta quedo la descarga.
# (En Windows las rutas llevan \ y en R eso da error; asi te lo ahorras.)
# datos <- read.csv(file.choose(), sep = ";", fileEncoding = "UTF-8")


# Opcion B — los datos de hoy, en vivo, por direccion web.
#
# Funciona porque el formulario de hoy es publico y tiene guardada una
# "configuracion de exportacion". Para tu propia encuesta, lo normal es la
# opcion A. Si faltan respuestas, vuelve a correr la linea.
#
# OJO: esta direccion solo funciona mientras el formulario tenga abierta la
# lectura publica de respuestas. Se abre el dia del taller y se cierra despues
# (kobo/deploy.py --cerrar-datos), asi que fuera de ese dia da 404.
# datos <- read.csv("https://kf.kobotoolbox.org/api/v2/assets/TU_FORMULARIO/export-settings/TU_EXPORTACION/data.csv",
#                   sep = ";", fileEncoding = "UTF-8")


# Opcion C — datos de ejemplo. Funciona siempre, sin conexion.
datos <- read.csv("datos_ejemplo.csv", sep = ";", fileEncoding = "UTF-8")


# ---- 2. Mirar los datos ---------------------------------------------

head(datos)     # las primeras filas
nrow(datos)     # cuantas respuestas hay
names(datos)    # como se llama cada columna
str(datos)      # que tipo de dato hay en cada columna


# ---- 3. Quedarnos con las respuestas --------------------------------

# Kobo agrega columnas tecnicas (_id, _uuid, _submission_time...).
# R les pone una X adelante al leerlas. No las necesitamos.
respuestas <- c("instituto", "anios_experiencia", "area",
                "estudiantes_aula", "minutos_traslado", "uso_celular")

# Si esta mañana le agregamos preguntas a la encuesta, sus columnas NO estan en
# ese vector y se pierden en la linea de abajo. Para conservarlas, agrega el
# nombre que les pusimos — sale de names(datos), en el paso 2:
# respuestas <- c(respuestas, "nombre_de_la_pregunta_nueva")

datos <- datos[, respuestas]

head(datos)


# ---- 4. Resumen numerico --------------------------------------------

table(datos$area)                    # cuantos por familia profesional
mean(datos$anios_experiencia)        # promedio de anios ensenando
summary(datos$minutos_traslado)      # minimo, mediana, maximo del traslado

# Dos variables a la vez: una tabla cruzada
table(datos$area, datos$uso_celular)

# El promedio de traslado, separado por area
tapply(datos$minutos_traslado, datos$area, mean)


# ---- 5. Primeros graficos -------------------------------------------

# Grafico 1: cuantos participantes por familia profesional

# Los nombres son largos, asi que ampliamos el margen izquierdo.
# par(mar = ...) fija los margenes: abajo, izquierda, arriba, derecha.
par(mar = c(5, 9, 4, 2))

barplot(table(datos$area),
        horiz = TRUE,
        las   = 1,
        col   = "steelblue",
        xlab  = "Numero de participantes",
        main  = "Participantes por familia profesional")

# Grafico 2: como se reparten los anios de experiencia
hist(datos$anios_experiencia,
     breaks = 8,
     col    = "steelblue",
     xlab   = "Anios ensenando",
     ylab   = "Numero de participantes",
     main   = "Experiencia docente")


# ---- 6. Un grafico de dos variables ---------------------------------

# ¿El tiempo de traslado cambia segun la familia profesional?

# Aqui los nombres van abajo y girados, asi que el margen ancho es el de abajo.
par(mar = c(9, 5, 4, 2))

boxplot(minutos_traslado ~ area,
        data = datos,
        col  = "lightgray",
        las  = 2,
        xlab = "",
        ylab = "Minutos de traslado",
        main = "Traslado al instituto segun familia profesional")


# ---- 7. Guardar un grafico para llevarselo --------------------------

png("mi_grafico.png", width = 1000, height = 700)
par(mar = c(5, 9, 4, 2))
barplot(table(datos$area),
        horiz = TRUE, las = 1, col = "steelblue",
        xlab = "Numero de participantes",
        main = "Participantes por familia profesional")
dev.off()

# El archivo mi_grafico.png queda en la carpeta de trabajo:
getwd()

# Para volver a los margenes normales:
par(mar = c(5, 4, 4, 2) + 0.1)

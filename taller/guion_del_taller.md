# Guion del taller — media mañana

El **playbook reusable**: cómo se reparte la mañana, qué decisión sostiene el
diseño, y qué hacer cuando algo falla. No lleva nombres ni fechas.

Lo confirmado de un dictado concreto — cuántos inscritos, quién instala R, cómo
salió el proyector — vive en `fya/<sitio>/guion.md`. Trujillo 2026-08 es el
primero, y sirve de ejemplo de qué hay que averiguar antes de un viernes.

## Los tiempos

Relativos al inicio; el taller ocupa media mañana. Cada bloque indica **qué se
cae primero** si el tiempo aprieta.

| Min | Bloque | Si falta tiempo |
|---|---|---|
| 0–10 | Bienvenida, el flujo completo, **cómo funciona la mañana** | No se toca: es donde se explica que la encuesta es una sola y compartida |
| 10–35 | **1. Recorrer la encuesta** en el proyector y **agregarle 1–2 preguntas** que dicte la sala; redesplegar | Saltarse las preguntas nuevas y sólo recorrer el formulario — pero entonces la apertura no debe prometerlas |
| 35–50 | **2. Recolectar** — todos responden desde su celular | No se toca: es el corazón del taller |
| 50–60 | **3. Descargar** el CSV | Se puede hacer en 3 minutos |
| 60–75 | *Descanso* — opcionales: **crear su cuenta** de Kobo, **instalar R/RStudio** en la laptop propia | Acortar a 10; ambos se pueden hacer después con la guía |
| 75–105 | **4. Analizar** en RStudio | Reducir a `read.csv`, `summary`, `table`, `mean` |
| 105–120 | **5. Gráficas** | Dejar solo `barplot` |
| 120–130 | **Ahora ustedes**: clonar el formulario y cambiarle dos preguntas | Es lo primero que se cae — el análisis ya está hecho y los pasos están en la guía |
| 130–140 | Entrega del cuestionario de institutos + **encuesta de salida** + preguntas | La encuesta de salida no se toca: es la única lectura escrita que queda del taller |

## Una encuesta compartida, no veinte

La decisión de diseño que sostiene el taller: **se arma un solo formulario**, en
la pantalla, y todos lo responden.

- El análisis necesita **filas**. Con 25 respuestas, `table()` y `tapply()` dicen
  algo; con 2 o 3 respuestas por participante, la segunda mitad del taller se
  queda sin objeto.
- **El registro de cuentas es el asesino de mañanas.** Pide confirmación por
  correo y, con veinte personas a la vez, se lleva veinte minutos. Por eso va en
  el descanso, donde no bloquea a nadie.
- Lo que hace que se lleven una **capacidad** y no un recuerdo es el bloque
  *Ahora ustedes*: clonar el formulario, cambiarle dos preguntas, desplegarlo.
  Va al final a propósito — si falla, no arrastra nada.

**Dos puntos de control, con la mano levantada** — después de leer los datos
(`nrow(datos)`) y después de la primera gráfica. No son ceremonia: quien no vea
el número de filas está atascado y ya no entiende nada de lo que sigue, y en
silencio no se nota. Los dos que circulan van a las manos que faltan.

**Quien va rápido es el equipo de apoyo.** Dicho como encargo — «eres el tutor
de tu fila» — se acepta; supuesto, no pasa. Con treinta personas y dos que
circulan, no hay otra forma de llegar a todos. Y para quien no quiera hacer de
tutor, el encargo grande es cerrar el círculo solo: clonar, desplegar,
responderse desde el celular y **descargar su propio CSV** — la única pantalla
que en la sala no puede ver nadie más que el dueño del formulario.

⚠️ **El formulario tiene que existir antes de empezar**, porque el QR del cartel
impreso y la URL de datos de `taller.R` apuntan a él. Por eso el bloque 1 no es
«armar una encuesta desde cero» sino «recorrer una y **agregarle** las preguntas
que dicte la sala»: la parte en vivo es real, el QR sigue siendo válido, y la
apertura promete exactamente lo que va a pasar. Prometer que se arma entera y
después recorrer una ya hecha es la manera de empezar la mañana debiendo algo.

## El camino de R — la pregunta que hay que resolver antes de cada dictado

Dos caminos, y hay que elegir **uno** con antelación:

- **RStudio instalado en las máquinas del laboratorio** — sin internet sostenido,
  sin registros de cuenta. Es el camino preferido siempre que alguien de la sede
  pueda instalarlo antes (R primero, RStudio Desktop después: **el orden
  importa**). Preguntarlo con semanas de margen, no la semana de.
- **Posit Cloud desde el navegador** — no depende del laboratorio, pero pide
  internet sostenido y una cuenta por pareja. Queda como respaldo y como la ruta
  para practicar en casa; las direcciones de descarga van en la apertura, el
  descanso y la guía.

El material **no cambia** con la respuesta: `taller.R` corre idéntico instalado o
en el navegador, y la línea intercambiable de lectura de datos es lo que permite
cambiar de camino sin rehacer nada. Ése es el diseño — una buena noticia
simplifica; nunca obliga a rehacer.

## Plan B — construido de antemano, no improvisado

Los supuestos que pueden fallar y qué se hace con cada uno:

| Si falla | Plan B |
|---|---|
| **No hay conectividad** | Usar `data/datos_ejemplo.csv` y saltar la recolección en vivo. Decirlo abiertamente: trabajar con un archivo de respaldo es parte del método |
| **No hay laptops** | Todo R se hace en el proyector, con voluntarios dictando las líneas. La guía impresa (`handout/`) es lo que se llevan |
| **Las máquinas no tienen R instalado** | Posit Cloud desde el navegador — pero pide internet sostenido y una cuenta por pareja |
| **No hay internet estable para Posit Cloud** | RStudio instalado en la máquina, con el CSV desde una memoria USB — no necesita red |
| **Ni R instalado ni internet** | Se proyecta desde la máquina del facilitador y las parejas siguen con la guía impresa |
| **Posit Cloud no carga** | Mostrar las gráficas ya generadas (`slides/img/grafica_*.png`) y centrar la parte 4–5 en leer resultados, no en producirlos |
| **Kobo no despliega** | El formulario ya desplegado desde casa el día anterior sirve igual; el QR está en las diapositivas |
| **Nadie logra crear cuenta** | Se salta el bloque *Ahora ustedes*: los pasos están en la guía impresa y la cuenta se puede crear la semana siguiente |

**Regla general:** buenas respuestas a los pendientes (cuántas laptops, qué
conectividad) **simplifican** el taller; nunca obligan a rehacerlo.

## Inspección del laboratorio — el día antes, veinte minutos, con lista

Ir en persona **la víspera**, no la mañana misma: todo lo que falle la víspera
tiene una tarde y un técnico por delante; lo que falle el viernes tiene a treinta
docentes mirando. Si hay una reunión en el mismo edificio, encadenar la
inspección a continuación.

- [ ] 🔴 **El proyector — mirarlo al entrar, antes que nada de esta lista.** Es
      lo único de aquí cuyo arreglo se compra en una tienda, y las tiendas
      cierran. Ver el conector, probar la laptop propia, y dónde se sienta la
      máquina del facilitador.
      - **Si es HDMI:** cerrado, no hay nada más que hacer.
      - **Si es VGA — plan A, y no cuesta nada: presentar desde una máquina del
        laboratorio.** La memoria USB lleva el `.html` y el `.pdf` del deck,
        autocontenidos, y el proyector ya está conectado a ese equipo.
        ⭐ **Así el adaptador sale de la ruta crítica.** Lo único que se pierde
        son las notas del presentador → llevarlas en el celular o impresas
        (`handout/notas_presentador.pdf` existe justo para esto).
      - **Plan B:** comprar un adaptador HDMI→VGA esa tarde. Barato y común,
        pero depende de la hora y de la tienda; por eso el plan A va primero.
- [ ] **¿Está R instalado?** Abrir RStudio en 2–3 máquinas y correr
      `R.version.string`. Si falta algo, el técnico de la sede todavía está en el
      edificio — exactamente el margen que la visita compra
- [ ] **Precargar `taller.R` y `datos_ejemplo.csv` en todas las máquinas** (o al
      menos verificar que los puertos USB están habilitados — hay laboratorios
      que los bloquean). Esto elimina la distribución de archivos de la mañana
- [ ] **La ruta de datos, probada desde la conexión real:** abrir la URL de
      exportación de Kobo en el navegador de una máquina del laboratorio y correr
      `read.csv("https://…", sep = ";")`. ⚠️ **Requiere que el formulario esté
      desplegado antes de la visita**
- [ ] **kf.kobotoolbox.org abre desde el navegador del laboratorio** (algunos
      filtros de red institucionales bloquean dominios desconocidos)
- [ ] **Señal de celular dentro de la sala** — la recolección corre por los datos
      móviles de los participantes, y una sala interior puede no tener cobertura
- [ ] **Teclado:** distribución latinoamericana o española — dónde están `:`,
      `/`, `$`, `~` y `<-`, que es lo que las parejas van a escribir
- [ ] **Pedir la lista de inscripción** a la sede — es la pregunta de asistencia
      respondida un día antes, y `fya/<sitio>/` necesita la institución de cada
      participante

## Antes de salir

- [ ] `slides/taller_<sitio>.html` y `.pdf` compilados y copiados a una memoria USB
- [ ] `handout/guia.pdf` **y** `handout/codigo.pdf` impresos — tantas copias como
      participantes. Son dos hojas distintas a propósito: la guía (una cara) se
      sigue mientras se trabaja en Kobo, y la de código se tiene al lado del
      teclado durante la parte de R
- [ ] `handout/carteles.pdf` impreso — los QR a página completa, por si falla el proyector
- [ ] Formulario de Kobo desplegado y **probado desde un celular de verdad**,
      respondiéndolo entero — no sólo abierto en la computadora. Las apariencias
      de las preguntas de opciones (`minimal` vs `autocomplete`) se ven bien en
      pantalla grande y mal en el teléfono; QR real en las diapositivas
- [ ] **Los dos enlaces del formulario repartidos, no uno:** el de **responder**
      (`ee.kobotoolbox.org/x/…`, el del cartel y el QR) y el del **proyecto**
      (`kf.kobotoolbox.org/#/forms/…`, el único desde el que se puede clonar).
      El bloque *Ahora ustedes* no se puede hacer sin el segundo, y el segundo no
      está en ningún papel de la pared: va proyectado y escrito en la guía
- [ ] `data/datos_ejemplo.csv` en la memoria USB, junto a `R/taller.R`
- [ ] 🔴 **Los instaladores de R y RStudio para Windows, en la memoria USB.**
      Muchos traen su propia laptop, y quince descargas simultáneas de ~300 MB
      sobre la red del instituto no terminan nunca. Son 300 MB en la USB y
      quitan la dependencia más grande del camino «traje mi computadora»
- [ ] Encuesta de salida desplegada y su QR en las diapositivas
- [ ] **Comprobado cuál de las tres opciones de lectura queda activa en
      `taller.R`** — A (archivo descargado, `file.choose()`), B (dirección en
      vivo) o C (datos de ejemplo). Sólo el dueño del formulario puede
      descargar, así que en la sala normalmente es la **B**; si no hay
      configuración de exportación guardada ni formulario público, es la **A**
      con el CSV repartido por USB
- [ ] Una prueba completa hecha de principio a fin por uno mismo
- [ ] **Abrir la lectura pública de respuestas** del formulario de práctica: es
      lo que permite que la sala lea los datos en R por dirección web. La deja
      abierta `deploy.py --form practica`

## Después del taller — la misma semana

- [ ] 🔴 **Cerrar la lectura pública de respuestas:**
      `kobo/deploy.py --sitio <sitio> --cerrar-datos`. Durante el taller esa
      lectura es lo que hace posible la opción B; dejarla abierta después
      publica al mundo lo que respondieron los participantes — instituto, área,
      años enseñando, tamaño del aula. No son nombres, pero en una región
      pequeña identifican. No borra nada: sólo deja de verlo quien no tenga
      cuenta
- [ ] **Devolver `taller.R` a la opción C** (datos de ejemplo), que es la que
      funciona siempre. Con la lectura cerrada, la opción B da 404
- [ ] **Mandar el correo prometido:** material, constancia y, a quien lo marcó,
      lo del taller más largo. Se prometió en voz alta; hay que cumplirlo
- [ ] **Descargar las respuestas de la encuesta de salida** y leerlas antes de
      que se enfríen

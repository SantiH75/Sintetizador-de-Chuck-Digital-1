# TROMPETA (PROYECTO ELECTRÓNICA DIGITAL)

Integrantes:

- Paula Quiroga Romero
- Jesús Sanchez Cobos
- Sergio Daniel Ávila Quintana
- Santiago Herrera Acuña

En este repositorio se encuentra el proceso de diseño e implementación de un modulo digital que simula el funcionamiento de un trombón a través de sistemas digitales usando dispositivos como la FPGA y sistemas de comunicaiones como la ESP32.

# Introducción

Par el desarrollo de los instrumentos musicales, pasando primero por procesos de generación de sonidos analógicos, era necesario utilizar distintos modelos que aprovecharan las propiedades dee transmisión de ondas que aprovecharan las frecuencia fundamentales del sistema; el inconveniente surge en lo complicado y dispendioso que puede llegar a ser el proceso de establecer correctamente las notas musicales (traducidas en frecuencia) al tener las limitaciones propias de un sistema analógico. De esta manera, con el entendimiento de la lógica digital, el problema se puede solucionar de más sencilla al utilizar valores discretos para la genracion de sonido. 

En el caso particular de los instrumentos de viento, estos aprovechan un flujo de aire que vibra dentro del instrumento, que cambia su afinación según los pistones que estén presionados, para finalmente ser amplificado; está lógica puede ser "simulada" en un sistema digital como se verá a continuación

# Objetivos 

- Entender el comportamiento modular en el diseño de un sistema digital a través de la implementación de un instruemnto que tenga como base circuito lógicos digitales para modificaci´´on tonal de un soonido.
- Hacer uso de circuitos combinacionales como herramienta para la construcción de sistemas con un número finito de estados para amnipular las frecuencias enviadas.
- Utilizar lógica secuencial para detectar cambios en el tiempo de la implementación física representados en un sensor que interactue como transductor en el sistema.
- Plantear la interacción entre difreneets módulos del sistema para que funcionen y se complementen de manera simultánea.
- Establecer un sistema de comunicación para el módulo general del instrumento.
- Desarrollar un diseño físico que soporte y optimize el uso físico del instrumento a tarvés de modelado.

# Planteamiento

## Hola

# TROMPETA (PROYECTO ELECTRÓNICA DIGITAL)

Integrantes:

- Paula Quiroga Romero
- Jesús Sanchez Cobos
- Sergio Daniel Ávila Quintana
- Santiago Herrera Acuña

En este repositorio se encuentra el proceso de diseño e implementación de un modulo digital que simula el funcionamiento de un trombón a través de sistemas digitales usando dispositivos como la FPGA y sistemas de comunicaiones como la ESP32.

# Introducción

Par el desarrollo de los instrumentos musicales, pasando primero por procesos de generación de sonidos analógicos, era necesario utilizar distintos modelos que aprovecharan las propiedades dee transmisión de ondas que aprovecharan las frecuencia fundamentales del sistema; el inconveniente surge en lo complicado y dispendioso que puede llegar a ser el proceso de establecer correctamente las notas musicales (traducidas en frecuencia) al tener las limitaciones propias de un sistema analógico. De esta manera, con el entendimiento de la lógica digital, el problema se puede solucionar de más sencilla al utilizar valores discretos para la genracion de sonido. 

En el caso particular de los instrumentos de viento, estos aprovechan un flujo de aire que vibra dentro del instrumento, que cambia su afinación según los pistones que estén presionados, para finalmente ser amplificado; está lógica puede ser _simulada_ en un sistema digital como se verá a continuación

<p align="center">
<img width="444" height="259" alt="image" src="https://github.com/SantiH75/Sintetizador-de-Chuck-Digital-1/blob/main/Trompeta_/Trompeta-Hal-Gatewood-Unsplash.jpg" />
</p>

# Objetivos 

- Entender el comportamiento modular en el diseño de un sistema digital a través de la implementación de un instruemnto que tenga como base circuito lógicos digitales para modificaci´´on tonal de un soonido.
- Hacer uso de circuitos combinacionales como herramienta para la construcción de sistemas con un número finito de estados para amnipular las frecuencias enviadas.
- Utilizar lógica secuencial para detectar cambios en el tiempo de la implementación física representados en un sensor que interactue como transductor en el sistema.
- Plantear la interacción entre difreneets módulos del sistema para que funcionen y se complementen de manera simultánea.
- Establecer un sistema de comunicación para el módulo general del instrumento.
- Desarrollar un diseño físico que soporte y optimize el uso físico del instrumento a tarvés de modelado.

# Planteamiento

De la sección de introducción, logra abstraen tres momentos importantes en el funcionamiento de un instrumento de viento:

- Generación de sonido a través debido a una vibración generada por el flujo del aire.
- Modificación de la frecuencia a través de actuadores (pistones).
- Amplificación del sonido ya modificado.

Estas tres partes serán los tres modulos principales del proyecto, dos de ellos funcionando de manera simultánea, la generación de flujo de aire, para finalizar en el último paso, que es la amplificación. De esta manera, lo primero que se establece es un orden en desarrollo de los modulos, a su vez, estableciendo su análogo digital:

1. **Sistema de pistones:** Se utiliza un sistema de pulsadores que funcione como _multiplexor_ para la selección mutuamente excluyente entre 8 notas diferentes.
2. **Actuador con flujo de aire:** Con ayuda de un sensor magnético, se utiliza un contador, limitado a través de un temporizador para obtener la rapidez del conteo de pulsos, y por ende, determinar la altura máxima del sonido.
3. **Producción de sonido:** Con el dato de la nota y la altura correspondiente, se transmiten los datos a través de la ESP33 por protocolo UART, y se llevan a un script de Chuck para su ejecución.

## Sistema de pulsadores

La unidad básica de la música se construye a través de notas musicales, que no son más, que una onda sonorá con cierta frecuencia característica reconocicle al oido humano.

En el sistema de música occidental, sin contar las frecuencias que son multiplos de otras, existen 12 notas musicales. Sin embargo, es común seleccionar 8 de estas notas con relaciones espeíficas entre sí para que suenen agradables (se le llama escala musical), y le brinden cierta sonoridad específica. La escala más conocida es la de Do mayor, que se representan a través de las 8 notas blancas de un teclado, y presenta las 7 notas qe se reconocen comunmente (Do, re, mi, fa, sol, la, si), y adicional, una nota que dobla en frecuencia al primer do (denominado en este proyecto como do alto).


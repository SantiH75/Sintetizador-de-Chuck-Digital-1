#include "libs/time.h"
#include "libs/uart.h"
#include <stdint.h>

// Definición de direcciones de memoria (equivalentes a las constantes en ASM)
#define IO_BASE 0x400000
#define LASER   0x410000
#define GET_LASER 0x02


//mapeo de registros
volatile uint32_t *const get_laser = (uint32_t *)(LASER + GET_LASER);

// Punteros a los registros de hardware
volatile uint32_t *const gp = (uint32_t *)IO_BASE;

// Mensaje a mostrar (equivalente a la sección .data)
char buffer[16] = "start LASER\n\r";  // Se crea un buffer de caracteres para enviar textos por UART.



int main() {
  putstring(buffer);
  uint8_t laserin = 0;  //Se declara una variable de 8 bits llamada laserin que almacenará lo leído del láser.
  // Inicialización del stack pointer (simulado)
  // En realidad en C esto lo hace el startup code
  while (1) { // Equivalente al main_loop
    putstring("\nAcorde: \r\n");
    laserin = *get_laser; // capturar
    itoa_simple_signed(laserin, buffer); // transforma a str
    putstring(buffer); // Imprime por uart
    wait(20); // Valor arbitrario para el wait (en ASM se usaba a0)
  }
  return 0; // Nunca se alcanzará
}

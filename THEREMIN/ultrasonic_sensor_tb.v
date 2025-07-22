`timescale 1ns/1ps

module tb_ultrasonic_sensor;
  // Señales
  reg         clk;
  reg         rst;
  reg         echo;
  wire        trigger;
  wire [15:0] distance_cm;
  wire        distance_ready;

  // Instanciación del DUT
  ultrasonic_sensor uut (
    .clk(clk),
    .rst(rst),
    .echo(echo),
    .trigger(trigger),
    .distance_cm(distance_cm),
    .distance_ready(distance_ready)
  );

  // Generador de reloj 50 MHz
  initial clk = 0;
  always #10 clk = ~clk;

  // Flujo de simulación principal
  initial begin
    // Dump para GTKWave (opcional)
    $dumpfile("tb_ultrasonic.vcd");
    $dumpvars(0, tb_ultrasonic_sensor);

    // Reset inicial
    rst = 1;
    echo = 0;
    #100;       // 100 ns de reset
    rst = 0;

    // Pruebas para varias distancias
    test_distance(10);
    test_distance(20);
    test_distance(30);

    $finish;
  end

  // Tarea que genera el pulso de echo y mide el resultado
  task test_distance(input integer cm);
    integer cycles;
    begin
      // 1) Esperar a que termine el pulso de trigger
      wait(trigger);        // sube
      wait(!trigger);       // baja

      // 2) Retardo antes de simular el eco (opcional, p. ej. 1000 ciclos)
      repeat(1000) @(posedge clk);

      // 3) Generar pulso echo
      echo = 1;
      cycles = cm * 2900;   // cálculo interno: timer/2900 → cm
      repeat(cycles) @(posedge clk);
      echo = 0;

      // 4) Esperar que distance_ready se active
      wait(distance_ready);
      $display("Esperado: %0d cm, Medido: %0d cm", cm, distance_cm);

      // 5) Dejar que el módulo vuelva a estado idle
      @(posedge clk);
      wait(!distance_ready);
      $display("-------------------------------");
    end
  endtask

endmodule

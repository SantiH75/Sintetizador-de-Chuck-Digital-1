`timescale 1ns/1ps

module midi_note_sender_tb;

    reg clk = 0;
    reg rst = 1;
    reg [15:0] distance_cm = 0;
    reg distance_ready = 0;
    wire [7:0] midi_byte;
    wire midi_send;
    reg uart_ready = 1;

    // Instancia del módulo a probar
    midi_note_sender uut (
        .clk(clk),
        .rst(rst),
        .distance_cm(distance_cm),
        .distance_ready(distance_ready),
        .midi_byte(midi_byte),
        .midi_send(midi_send),
        .uart_ready(uart_ready)
    );

    // Generación de reloj (10ns periodo)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("midi_note_sender.vcd");       // Archivos de señales
        $dumpvars(0, midi_note_sender_tb);       // Captura todas las señales del testbench

        // Reset inicial
        #10 rst = 0;

        // Primer evento: se mide una distancia válida
        #10 distance_cm = 20;
            distance_ready = 1;
        #10 distance_ready = 0;

        // Segundo evento: otra distancia
        #100 distance_cm = 55;
             distance_ready = 1;
        #10  distance_ready = 0;

        // Esperar un poco más
        #100;

        $finish;
    end

endmodule

`timescale 1ns/1ps

module midi_volume_sender_tb;

    reg clk = 0;
    reg rst = 1;
    reg [15:0] distance_cm = 0;
    reg distance_ready = 0;
    wire [7:0] midi_byte;
    wire midi_send;
    reg uart_ready = 1;

    // Instancia del módulo
    midi_volume_sender uut (
        .clk(clk),
        .rst(rst),
        .distance_cm(distance_cm),
        .distance_ready(distance_ready),
        .midi_byte(midi_byte),
        .midi_send(midi_send),
        .uart_ready(uart_ready)
    );

    // Generar reloj (10 ns)
    always #5 clk = ~clk;

    initial begin
        $dumpfile("midi_volume_sender.vcd");
        $dumpvars(0, midi_volume_sender_tb);

        // Reset
        #10 rst = 0;

        // Primera prueba: distancia 20 cm
        #10 distance_cm = 20;
            distance_ready = 1;
        #10 distance_ready = 0;

        // Espera a que se envíen los 3 bytes MIDI
        #100;

        // Segunda prueba: distancia 5 cm (volumen = 127)
        #10 distance_cm = 5;
            distance_ready = 1;
        #10 distance_ready = 0;

        #100;

        // Tercera prueba: distancia 60 cm (volumen ~0)
        #10 distance_cm = 60;
            distance_ready = 1;
        #10 distance_ready = 0;

        #200;
        $finish;
    end
endmodule

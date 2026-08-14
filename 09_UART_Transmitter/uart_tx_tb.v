`timescale 1ns/1ps

module uart_tx_tb;

    reg clk;
    reg reset;
    reg tx_start;
    reg [7:0] data_in;

    wire tx;
    wire busy;

    // Instantiate UART Transmitter
    uart_tx #(
        .CLK_FREQ(50000000),
        .BAUD_RATE(9600)
    ) DUT (
        .clk(clk),
        .reset(reset),
        .tx_start(tx_start),
        .data_in(data_in),
        .tx(tx),
        .busy(busy)
    );

    // Clock Generation (50 MHz)
    initial
        clk = 0;

    always #10 clk = ~clk;

    // Test Sequence
    initial
    begin
        reset = 1;
        tx_start = 0;
        data_in = 8'h00;

        #100;
        reset = 0;

        // Send first byte
        #100;
        data_in = 8'hA5;
        tx_start = 1;

        #20;
        tx_start = 0;

        // Wait until transmission finishes
        #1000000;

        // Send second byte
        data_in = 8'h3C;
        tx_start = 1;

        #20;
        tx_start = 0;

        #1000000;

        $finish;
    end

    // Generate waveform
    initial
    begin
        $dumpfile("uart_tx.vcd");
        $dumpvars(0, uart_tx_tb);
    end

endmodule
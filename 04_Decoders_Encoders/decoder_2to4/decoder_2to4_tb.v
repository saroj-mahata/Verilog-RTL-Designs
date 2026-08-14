`timescale 1ns/1ps

module decoder_2to4_tb;

reg a;
reg b;

wire y0;
wire y1;
wire y2;
wire y3;

decoder_2to4 uut (
    .a(a),
    .b(b),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3)
);

initial begin

    $dumpfile("decoder_wave.vcd");
    $dumpvars(0, decoder_2to4_tb);

    $display("A B | Y0 Y1 Y2 Y3");
    $display("-----------------");

    a = 0; b = 0; #10;
    $display("%b %b | %b  %b  %b  %b",
             a, b, y0, y1, y2, y3);

    a = 0; b = 1; #10;
    $display("%b %b | %b  %b  %b  %b",
             a, b, y0, y1, y2, y3);

    a = 1; b = 0; #10;
    $display("%b %b | %b  %b  %b  %b",
             a, b, y0, y1, y2, y3);

    a = 1; b = 1; #10;
    $display("%b %b | %b  %b  %b  %b",
             a, b, y0, y1, y2, y3);

    $finish;

end

endmodule
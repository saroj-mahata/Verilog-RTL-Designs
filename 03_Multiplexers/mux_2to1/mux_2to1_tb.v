`timescale 1ns/1ps

module mux_2to1_tb;

reg i0;
reg i1;
reg s;

wire y;

mux_2to1 uut (
    .i0(i0),
    .i1(i1),
    .s(s),
    .y(y)
);

initial begin

    $dumpfile("mux_wave.vcd");
    $dumpvars(0, mux_2to1_tb);

    $display("I0 I1 S | Y");
    $display("-----------");

    i0 = 0; i1 = 1; s = 0; #10;
    $display("%b  %b  %b | %b", i0, i1, s, y);

    i0 = 0; i1 = 1; s = 1; #10;
    $display("%b  %b  %b | %b", i0, i1, s, y);

    i0 = 1; i1 = 0; s = 0; #10;
    $display("%b  %b  %b | %b", i0, i1, s, y);

    i0 = 1; i1 = 0; s = 1; #10;
    $display("%b  %b  %b | %b", i0, i1, s, y);

    $finish;

end

endmodule
`timescale 1ns/1ps

module mux_4to1_tb;

reg i0;
reg i1;
reg i2;
reg i3;

reg s0;
reg s1;

wire y;

mux_4to1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s0(s0),
    .s1(s1),
    .y(y)
);

initial begin

    $dumpfile("mux_4to1_wave.vcd");
    $dumpvars(0, mux_4to1_tb);

    $display("S1 S0 | Y");
    $display("---------");

    i0 = 0;
    i1 = 1;
    i2 = 0;
    i3 = 1;

    s1 = 0; s0 = 0; #10;
    $display("%b  %b  | %b", s1, s0, y);

    s1 = 0; s0 = 1; #10;
    $display("%b  %b  | %b", s1, s0, y);

    s1 = 1; s0 = 0; #10;
    $display("%b  %b  | %b", s1, s0, y);

    s1 = 1; s0 = 1; #10;
    $display("%b  %b  | %b", s1, s0, y);

    $finish;

end

endmodule
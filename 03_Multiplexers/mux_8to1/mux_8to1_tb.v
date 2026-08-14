`timescale 1ns/1ps

module mux_8to1_tb;

reg i0;
reg i1;
reg i2;
reg i3;
reg i4;
reg i5;
reg i6;
reg i7;

reg [2:0] s;

wire y;

mux_8to1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .i4(i4),
    .i5(i5),
    .i6(i6),
    .i7(i7),
    .s(s),
    .y(y)
);

initial begin

    $dumpfile("mux_8to1_wave.vcd");
    $dumpvars(0, mux_8to1_tb);

    $display("SELECT | Y");
    $display("----------");

    i0 = 0;
    i1 = 1;
    i2 = 0;
    i3 = 1;
    i4 = 1;
    i5 = 0;
    i6 = 1;
    i7 = 0;

    s = 3'b000; #10;
    $display(" %b   | %b", s, y);

    s = 3'b001; #10;
    $display(" %b   | %b", s, y);

    s = 3'b010; #10;
    $display(" %b   | %b", s, y);

    s = 3'b011; #10;
    $display(" %b   | %b", s, y);

    s = 3'b100; #10;
    $display(" %b   | %b", s, y);

    s = 3'b101; #10;
    $display(" %b   | %b", s, y);

    s = 3'b110; #10;
    $display(" %b   | %b", s, y);

    s = 3'b111; #10;
    $display(" %b   | %b", s, y);

    $finish;

end

endmodule
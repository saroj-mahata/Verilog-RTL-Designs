`timescale 1ns/1ps

module alu_4bit_tb;

reg [3:0] a;
reg [3:0] b;
reg [1:0] sel;

wire [3:0] y;

alu_4bit uut (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y)
);

initial begin

    $dumpfile("alu_4bit_wave.vcd");
    $dumpvars(0, alu_4bit_tb);

    $display("A     B     SEL | Y");
    $display("--------------------");

    a = 4'b0101;
    b = 4'b0011;

    sel = 2'b00; #10;
    $display("%b  %b  %b  | %b", a, b, sel, y);

    sel = 2'b01; #10;
    $display("%b  %b  %b  | %b", a, b, sel, y);

    sel = 2'b10; #10;
    $display("%b  %b  %b  | %b", a, b, sel, y);

    sel = 2'b11; #10;
    $display("%b  %b  %b  | %b", a, b, sel, y);

    $finish;

end

endmodule
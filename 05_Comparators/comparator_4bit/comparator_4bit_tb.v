`timescale 1ns/1ps

module comparator_4bit_tb;

reg [3:0] a;
reg [3:0] b;

wire greater;
wire equal;
wire less;

comparator_4bit uut (
    .a(a),
    .b(b),
    .greater(greater),
    .equal(equal),
    .less(less)
);

initial begin

    $dumpfile("comparator_4bit_wave.vcd");
    $dumpvars(0, comparator_4bit_tb);

    $display("A     B     | GREATER EQUAL LESS");
    $display("--------------------------------");

    a = 4'b0101;
    b = 4'b0011;
    #10;

    $display("%b  %b  |    %b      %b     %b",
             a, b, greater, equal, less);

    a = 4'b0010;
    b = 4'b0110;
    #10;

    $display("%b  %b  |    %b      %b     %b",
             a, b, greater, equal, less);

    a = 4'b1000;
    b = 4'b1000;
    #10;

    $display("%b  %b  |    %b      %b     %b",
             a, b, greater, equal, less);

    $finish;

end

endmodule

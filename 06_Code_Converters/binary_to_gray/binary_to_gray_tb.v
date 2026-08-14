`timescale 1ns/1ps

module binary_to_gray_tb;

reg [3:0] binary;

wire [3:0] gray;

binary_to_gray uut (
    .binary(binary),
    .gray(gray)
);

initial begin

    $dumpfile("binary_to_gray_wave.vcd");
    $dumpvars(0, binary_to_gray_tb);

    $display("BINARY | GRAY");
    $display("-------------");

    binary = 4'b0000; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0001; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0010; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0011; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0100; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0101; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0110; #10;
    $display(" %b  | %b", binary, gray);

    binary = 4'b0111; #10;
    $display(" %b  | %b", binary, gray);

    $finish;

end

endmodule

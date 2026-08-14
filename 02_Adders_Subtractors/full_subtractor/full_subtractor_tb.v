`timescale 1ns/1ps

module full_subtractor_tb;

reg a;
reg b;
reg bin;

wire difference;
wire borrow;

full_subtractor uut (
    .a(a),
    .b(b),
    .bin(bin),
    .difference(difference),
    .borrow(borrow)
);

initial begin

    $dumpfile("full_subtractor_wave.vcd");
    $dumpvars(0, full_subtractor_tb);

    $display("A B Bin | DIFF BORROW");
    $display("---------------------");

    a = 0; b = 0; bin = 0; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 0; b = 0; bin = 1; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 0; b = 1; bin = 0; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 0; b = 1; bin = 1; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 1; b = 0; bin = 0; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 1; b = 0; bin = 1; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 1; b = 1; bin = 0; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    a = 1; b = 1; bin = 1; #10;
    $display("%b %b  %b  |   %b     %b",
             a, b, bin, difference, borrow);

    $finish;

end

endmodule
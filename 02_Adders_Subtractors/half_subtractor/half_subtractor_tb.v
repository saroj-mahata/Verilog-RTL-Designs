`timescale 1ns/1ps

module half_subtractor_tb;

reg a;
reg b;

wire difference;
wire borrow;

half_subtractor uut (
    .a(a),
    .b(b),
    .difference(difference),
    .borrow(borrow)
);

initial begin

    $dumpfile("half_subtractor_wave.vcd");
    $dumpvars(0, half_subtractor_tb);

    $display("A B | DIFF BORROW");
    $display("-----------------");

    a = 0; b = 0; #10;
    $display("%b %b |   %b     %b", a, b, difference, borrow);

    a = 0; b = 1; #10;
    $display("%b %b |   %b     %b", a, b, difference, borrow);

    a = 1; b = 0; #10;
    $display("%b %b |   %b     %b", a, b, difference, borrow);

    a = 1; b = 1; #10;
    $display("%b %b |   %b     %b", a, b, difference, borrow);

    $finish;

end

endmodule
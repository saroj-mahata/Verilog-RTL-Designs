`timescale 1ns/1ps

module full_adder_tb;

reg a;
reg b;
reg cin;

wire sum;
wire carry;

full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

initial begin

    $dumpfile("full_adder_wave.vcd");
    $dumpvars(0, full_adder_tb);

    $display("A B Cin | SUM CARRY");
    $display("--------------------");

    a = 0; b = 0; cin = 0; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 0; b = 0; cin = 1; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 0; b = 1; cin = 0; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 0; b = 1; cin = 1; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 1; b = 0; cin = 0; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 1; b = 0; cin = 1; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 1; b = 1; cin = 0; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    a = 1; b = 1; cin = 1; #10;
    $display("%b %b  %b  |  %b     %b", a, b, cin, sum, carry);

    $finish;

end

endmodule
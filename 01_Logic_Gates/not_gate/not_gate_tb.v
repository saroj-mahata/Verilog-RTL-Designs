`timescale 1ns/1ps

module not_gate_tb;

reg a;
wire y;

not_gate uut (
    .a(a),
    .y(y)
);

initial begin
    $dumpfile("not_wave.vcd");
    $dumpvars(0, not_gate_tb);

    $display("A | Y");
    $display("-----");

    a = 0; #10;
    $display("%b | %b", a, y);

    a = 1; #10;
    $display("%b | %b", a, y);

    $finish;
end

endmodule
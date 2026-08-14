`timescale 1ns/1ps

module priority_encoder_tb;

reg i0;
reg i1;
reg i2;
reg i3;

wire a;
wire b;

priority_encoder uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .a(a),
    .b(b)
);

initial begin

    $dumpfile("priority_encoder_wave.vcd");
    $dumpvars(0, priority_encoder_tb);

    $display("I3 I2 I1 I0 | A B");
    $display("-----------------");

    i3=0; i2=0; i1=0; i0=1; #10;
    $display("%b  %b  %b  %b | %b %b",
             i3, i2, i1, i0, a, b);

    i3=0; i2=0; i1=1; i0=1; #10;
    $display("%b  %b  %b  %b | %b %b",
             i3, i2, i1, i0, a, b);

    i3=0; i2=1; i1=1; i0=1; #10;
    $display("%b  %b  %b  %b | %b %b",
             i3, i2, i1, i0, a, b);

    i3=1; i2=1; i1=1; i0=1; #10;
    $display("%b  %b  %b  %b | %b %b",
             i3, i2, i1, i0, a, b);

    $finish;

end

endmodule
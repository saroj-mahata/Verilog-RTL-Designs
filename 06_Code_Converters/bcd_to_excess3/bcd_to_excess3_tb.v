`timescale 1ns/1ps

module bcd_to_excess3_tb;

reg [3:0] bcd;

wire [3:0] excess3;

bcd_to_excess3 uut (
    .bcd(bcd),
    .excess3(excess3)
);

initial begin

    $dumpfile("bcd_to_excess3_wave.vcd");
    $dumpvars(0, bcd_to_excess3_tb);

    $display("BCD  | EXCESS-3");
    $display("----------------");

    bcd = 4'b0000; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0001; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0010; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0011; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0100; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0101; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0110; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b0111; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b1000; #10;
    $display("%b |   %b", bcd, excess3);

    bcd = 4'b1001; #10;
    $display("%b |   %b", bcd, excess3);

    $finish;

end

endmodule

`timescale 1ns/1ps

module demux_1to2_tb;

reg d;
reg s;

wire y0;
wire y1;

demux_1to2 uut (
    .d(d),
    .s(s),
    .y0(y0),
    .y1(y1)
);

initial begin

    $dumpfile("demux_wave.vcd");
    $dumpvars(0, demux_1to2_tb);

    $display("D S | Y0 Y1");
    $display("-----------");

    d = 0; s = 0; #10;
    $display("%b %b | %b  %b", d, s, y0, y1);

    d = 0; s = 1; #10;
    $display("%b %b | %b  %b", d, s, y0, y1);

    d = 1; s = 0; #10;
    $display("%b %b | %b  %b", d, s, y0, y1);

    d = 1; s = 1; #10;
    $display("%b %b | %b  %b", d, s, y0, y1);

    $finish;

end

endmodule
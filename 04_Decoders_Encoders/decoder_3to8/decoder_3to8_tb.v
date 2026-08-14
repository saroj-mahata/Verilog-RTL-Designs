`timescale 1ns/1ps

module decoder_3to8_tb;

reg a;
reg b;
reg c;

wire y0;
wire y1;
wire y2;
wire y3;
wire y4;
wire y5;
wire y6;
wire y7;

decoder_3to8 uut (
    .a(a),
    .b(b),
    .c(c),
    .y0(y0),
    .y1(y1),
    .y2(y2),
    .y3(y3),
    .y4(y4),
    .y5(y5),
    .y6(y6),
    .y7(y7)
);

initial begin

    $dumpfile("decoder_3to8_wave.vcd");
    $dumpvars(0, decoder_3to8_tb);

    $display("A B C | Y7 Y6 Y5 Y4 Y3 Y2 Y1 Y0");
    $display("---------------------------------");

    a=0; b=0; c=0; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=0; b=0; c=1; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=0; b=1; c=0; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=0; b=1; c=1; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=1; b=0; c=0; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=1; b=0; c=1; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=1; b=1; c=0; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    a=1; b=1; c=1; #10;
    $display("%b %b %b | %b  %b  %b  %b  %b  %b  %b  %b",
    a,b,c,y7,y6,y5,y4,y3,y2,y1,y0);

    $finish;

end

endmodule

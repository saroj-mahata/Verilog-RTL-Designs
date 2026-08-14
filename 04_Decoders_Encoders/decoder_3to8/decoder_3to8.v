module decoder_3to8(
    input a,
    input b,
    input c,
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7
);

assign y0 = ~a & ~b & ~c;
assign y1 = ~a & ~b &  c;
assign y2 = ~a &  b & ~c;
assign y3 = ~a &  b &  c;
assign y4 =  a & ~b & ~c;
assign y5 =  a & ~b &  c;
assign y6 =  a &  b & ~c;
assign y7 =  a &  b &  c;

endmodule
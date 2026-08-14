module encoder_4to2(
    input i0,
    input i1,
    input i2,
    input i3,
    output a,
    output b
);

assign a = i2 | i3;
assign b = i1 | i3;

endmodule
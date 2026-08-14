module mux_8to1(
    input i0,
    input i1,
    input i2,
    input i3,
    input i4,
    input i5,
    input i6,
    input i7,
    input [2:0] s,
    output reg y
);

always @(*) begin

    case(s)

        3'b000: y = i0;
        3'b001: y = i1;
        3'b010: y = i2;
        3'b011: y = i3;
        3'b100: y = i4;
        3'b101: y = i5;
        3'b110: y = i6;
        3'b111: y = i7;

        default: y = 1'b0;

    endcase

end

endmodule

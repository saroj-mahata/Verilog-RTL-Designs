module priority_encoder(
    input i0,
    input i1,
    input i2,
    input i3,
    output reg a,
    output reg b
);

always @(*) begin

    if (i3) begin
        a = 1;
        b = 1;
    end

    else if (i2) begin
        a = 1;
        b = 0;
    end

    else if (i1) begin
        a = 0;
        b = 1;
    end

    else begin
        a = 0;
        b = 0;
    end

end

endmodule
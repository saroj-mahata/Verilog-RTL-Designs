module parity_generator(
    input [3:0] data,
    output parity
);

assign parity = ^data;

endmodule

`timescale 1ns/1ps

module parity_checker_tb;

reg [3:0] data;
reg parity;

wire error;

parity_checker uut (
    .data(data),
    .parity(parity),
    .error(error)
);

initial begin

    $dumpfile("parity_checker_wave.vcd");
    $dumpvars(0, parity_checker_tb);

    $display("DATA PARITY | ERROR");
    $display("-------------------");

    data = 4'b1011;
    parity = 1;
    #10;
    $display("%b    %b    |   %b",
             data, parity, error);

    data = 4'b1011;
    parity = 0;
    #10;
    $display("%b    %b    |   %b",
             data, parity, error);

    data = 4'b0011;
    parity = 0;
    #10;
    $display("%b    %b    |   %b",
             data, parity, error);

    data = 4'b0011;
    parity = 1;
    #10;
    $display("%b    %b    |   %b",
             data, parity, error);

    $finish;

end

endmodule

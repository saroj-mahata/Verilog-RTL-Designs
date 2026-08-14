`timescale 1ns/1ps

module parity_generator_tb;

reg [3:0] data;

wire parity;

parity_generator uut (
    .data(data),
    .parity(parity)
);

initial begin

    $dumpfile("parity_generator_wave.vcd");
    $dumpvars(0, parity_generator_tb);

    $display("DATA | EVEN PARITY");
    $display("------------------");

    data = 4'b0000; #10;
    $display("%b |      %b", data, parity);

    data = 4'b0001; #10;
    $display("%b |      %b", data, parity);

    data = 4'b0011; #10;
    $display("%b |      %b", data, parity);

    data = 4'b0111; #10;
    $display("%b |      %b", data, parity);

    data = 4'b1011; #10;
    $display("%b |      %b", data, parity);

    data = 4'b1111; #10;
    $display("%b |      %b", data, parity);

    $finish;

end

endmodule

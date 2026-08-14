`timescale 1ns/1ps

module fifo_tb;

    parameter DATA_WIDTH = 8;
    parameter DEPTH      = 16;

    reg clk;
    reg reset;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] data_in;

    wire [DATA_WIDTH-1:0] data_out;
    wire full;
    wire empty;

    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .reset(reset),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    // Waveform
    initial begin
        $dumpfile("fifo_wave.vcd");
        $dumpvars(0, fifo_tb);
    end

    // -----------------------------
    // Write task
    // -----------------------------
    task write_data(input [DATA_WIDTH-1:0] data);
    begin
        @(negedge clk);
        wr_en   = 1;
        rd_en   = 0;
        data_in = data;

        @(negedge clk);
        wr_en   = 0;

        $display("WRITE: %0d", data);
    end
    endtask

    // -----------------------------
    // Read task
    // -----------------------------
    task read_data;
    begin
        @(negedge clk);
        rd_en = 1;
        wr_en = 0;

        @(negedge clk);
        rd_en = 0;

        $display("READ : %0d", data_out);
    end
    endtask

    // -----------------------------
    // Main Test
    // -----------------------------
    integer i;

    initial begin

        clk     = 0;
        reset   = 1;
        wr_en   = 0;
        rd_en   = 0;
        data_in = 0;

        // Reset
        #20;
        reset = 0;

        $display("--------------------------------");
        $display("FIFO TEST START");
        $display("--------------------------------");

        // =================================
        // TEST 1: Normal Write
        // =================================

        write_data(8'd10);
        write_data(8'd20);
        write_data(8'd30);

        // =================================
        // TEST 2: Normal Read
        // =================================

        read_data;
        read_data;
        read_data;

        // =================================
        // TEST 3: Read Empty FIFO
        // =================================

        @(negedge clk);
        rd_en = 1;

        @(negedge clk);
        rd_en = 0;

        $display("READ EMPTY TEST: empty = %b", empty);

        // =================================
        // TEST 4: Fill FIFO
        // =================================

        for(i = 0; i < DEPTH; i = i + 1)
        begin
            write_data(i);
        end

        $display("FULL TEST: full = %b", full);

        // =================================
        // TEST 5: Extra Write
        // =================================

        write_data(8'hFF);

        $display("EXTRA WRITE TEST: full = %b", full);

        // =================================
        // TEST 6: Simultaneous Read/Write
        // =================================

        @(negedge clk);
        wr_en   = 1;
        rd_en   = 1;
        data_in = 8'hAA;

        @(negedge clk);
        wr_en = 0;
        rd_en = 0;

        $display("SIMULTANEOUS READ/WRITE TEST");

        // =================================
        // Finish
        // =================================

        #20;

        $display("--------------------------------");
        $display("FIFO TEST COMPLETE");
        $display("--------------------------------");

        $finish;

    end

endmodule
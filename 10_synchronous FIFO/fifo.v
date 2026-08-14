module fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH      = 16
)(
    input  clk,
    input  reset,

    input  wr_en,
    input  rd_en,

    input  [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,

    output full,
    output empty
);

    // Pointer width for DEPTH = 16 -> 4 bits
    localparam PTR_WIDTH = $clog2(DEPTH);

    // FIFO memory
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Read and write pointers
    reg [PTR_WIDTH-1:0] wr_ptr;
    reg [PTR_WIDTH-1:0] rd_ptr;

    // Number of stored elements
    reg [PTR_WIDTH:0] count;

    // ------------------------------------------------
    // Full and Empty
    // ------------------------------------------------
    assign empty = (count == 0);
    assign full  = (count == DEPTH);

    // ------------------------------------------------
    // Write and Read Logic
    // ------------------------------------------------
    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            wr_ptr   <= 0;
            rd_ptr   <= 0;
            count    <= 0;
            data_out <= 0;
        end
        else
        begin

            // -------------------------
            // Write operation
            // -------------------------
            if (wr_en && !full)
            begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1'b1;
            end

            // -------------------------
            // Read operation
            // -------------------------
            if (rd_en && !empty)
            begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1;
            end

            // -------------------------
            // Count update
            // -------------------------
            case ({wr_en && !full, rd_en && !empty})

                2'b10:
                    count <= count + 1'b1;

                2'b01:
                    count <= count - 1'b1;

                2'b11:
                    count <= count;

                default:
                    count <= count;

            endcase
        end
    end

endmodule
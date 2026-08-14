module uart_tx #(
    parameter CLK_FREQ  = 50000000,
    parameter BAUD_RATE = 9600
)(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,

    output reg tx,
    output reg busy
);

localparam BAUD_COUNT = CLK_FREQ / BAUD_RATE;

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state;

reg [12:0] baud_count;
reg baud_tick;

reg [2:0] bit_count;

reg [7:0] shift_reg;

//-------------------------
// Baud Rate Generator
//-------------------------
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        baud_count <= 13'd0;
        baud_tick  <= 1'b0;
    end
    else
    begin
        if(baud_count == BAUD_COUNT-1)
        begin
            baud_count <= 13'd0;
            baud_tick  <= 1'b1;
        end
        else
        begin
            baud_count <= baud_count + 1'b1;
            baud_tick  <= 1'b0;
        end
    end
end

//-------------------------
// State Register
//-------------------------
always @(posedge clk or posedge reset)
begin
    if(reset)
        current_state <= IDLE;
    else if(baud_tick)
        current_state <= next_state;
end

//-------------------------
// Next State Logic
//-------------------------
always @(*)
begin
    case(current_state)

        IDLE:
            if(tx_start)
                next_state = START;
            else
                next_state = IDLE;

        START:
            next_state = DATA;

        DATA:
            if(bit_count == 3'd7)
                next_state = STOP;
            else
                next_state = DATA;

        STOP:
            next_state = IDLE;

        default:
            next_state = IDLE;

    endcase
end

// Shift Register Logic
// (To be added)

// Output Logic
// (To be added)
//--------------------------------
// Shift Register & Bit Counter
//--------------------------------
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        shift_reg <= 8'd0;
        bit_count <= 3'd0;
    end
    else if(baud_tick)
    begin
        case(current_state)

            IDLE:
            begin
                bit_count <= 3'd0;

                if(tx_start)
                    shift_reg <= data_in;
            end

            DATA:
            begin
                shift_reg <= shift_reg >> 1;
                bit_count <= bit_count + 1'b1;
            end

            default:
            begin
                shift_reg <= shift_reg;
                bit_count <= bit_count;
            end

        endcase
    end
end
//--------------------------------
// Output Logic
//--------------------------------
always @(*)
begin
    // Default values
    tx   = 1'b1;
    busy = 1'b0;

    case(current_state)

        IDLE:
        begin
            tx   = 1'b1;   // UART line stays HIGH when idle
            busy = 1'b0;
        end

        START:
        begin
            tx   = 1'b0;   // Start bit
            busy = 1'b1;
        end

        DATA:
        begin
            tx   = shift_reg[0];   // Send LSB first
            busy = 1'b1;
        end

        STOP:
        begin
            tx   = 1'b1;   // Stop bit
            busy = 1'b1;
        end

        default:
        begin
            tx   = 1'b1;
            busy = 1'b0;
        end

    endcase
end

endmodule
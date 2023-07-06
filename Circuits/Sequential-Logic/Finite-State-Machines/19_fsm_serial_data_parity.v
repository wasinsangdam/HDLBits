module fsm_serialdp (
    input               clk,
    input               in,
    input               reset,
    output     [7 : 0]  out_byte,
    output              done
);

    parameter   [2 : 0] IDLE   = 0,
                        READ   = 1,
                        ERROR  = 2,
                        PARITY = 3,
                        DONE   = 4;
                        

    reg [2 : 0] state, next_state;
    reg [3 : 0] cnt;
    reg [7 : 0] temp;

    wire odd;
    wire parity_enable;

    always @(posedge clk) begin
        if (reset) state <= IDLE;
        else       state <= next_state;
    end

    always @(posedge clk) begin
        if (reset)              cnt <= 4'b0;
        else if (state == READ) cnt <= cnt + 1;
        else                    cnt <= 4'b0;
    end

    always @(*) begin
        case (state)
            IDLE  : next_state = ~in ? READ : IDLE;
            READ  : begin
                if ((cnt == 8) && (in == ~odd))
                    next_state = PARITY;
                else if ((cnt == 8) && ~(in == ~odd))
                    next_state = ERROR;
                else begin
                    next_state = READ;
                    temp[cnt] = in;
                end
            end
            ERROR : next_state = in ? IDLE : ERROR;
            PARITY: next_state = in ? DONE : ERROR;
            DONE  : next_state = in ? IDLE : READ;
        endcase
    end

    assign out_byte = (state == DONE) ? temp : 8'bx;
    assign done = (state == DONE);
    assign parity_enable = ~(state == READ);

    parity u0 (.clk(clk), .reset(parity_enable), .in(in), .odd(odd));

    /* For print state with ASCII on waveform */
    reg [47 : 0] debug_st;      // ASCII variable

    always @(*) begin           // Case statement
        case(state)
            IDLE  : debug_st = "IDLE";
            READ  : debug_st = "READ";
            ERROR : debug_st = "ERROR";
            PARITY: debug_st = "PARITY";
            DONE  : debug_st = "DONE";
        endcase
    end


endmodule

module parity (
    input       clk,
    input       reset,
    input       in,
    output reg  odd
);  

    always @(posedge clk) begin
        if      (reset) odd <= 1'b0;
        else if (in)    odd <= ~odd;
    end

endmodule
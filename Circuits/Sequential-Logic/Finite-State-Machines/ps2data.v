module ps2data (
    input            clk,
    input   [7 :  0] in,
    input            reset,
    output  [23 : 0] out_bytes,
    output           done
);

    parameter   [1 : 0] BYTE1 = 0,
                        BYTE2 = 1,
                        BYTE3 = 2,
                        DONE  = 3;
    
    reg         [1 : 0] state, next_state;
    reg         [7 : 0] temp1, temp2, temp3;

    always @ (posedge clk) begin
        if (reset)  begin
            state <= BYTE1;
        end
        else begin
            state <= next_state;
            
            if (state == BYTE1)      temp1 <= in;
            else if (state == BYTE2) temp2 <= in;
            else if (state == BYTE3) temp3 <= in;
            else                     temp1 <= in;
        end
    end

    always @ (*) begin
        case (state)
            BYTE1 : next_state <= in[3] ? BYTE2 : BYTE1;
            BYTE2 : next_state <= BYTE3;
            BYTE3 : next_state <= DONE;
            DONE  : next_state <= in[3] ? BYTE2 : BYTE1;
        endcase
    end

    assign done = (state == DONE);
    assign out_bytes = (state == DONE) ? {temp1, temp2, temp3} : 24'bx ;


endmodule
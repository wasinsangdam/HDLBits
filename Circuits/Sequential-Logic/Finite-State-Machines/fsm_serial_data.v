module fsm_serial_data (
    input               clk,
    input               in,
    input               reset,
    output reg [7 : 0]  out_byte,
    output              done
);
    


    parameter   [1 : 0] IDLE = 0,
                        READ = 1,
                        DONE = 2,
                        ERR  = 3;

    reg         [1 : 0] state, next_state;
    reg         [3 : 0] cnt;
    reg         [7 : 0] temp;

    always @ (posedge clk) begin
        if (reset)  state <= IDLE;
        else begin
            state <= next_state;

            if (state == READ) begin
                cnt <= cnt + 1;
            end 
            else cnt <= 0;
        end
    end


    always @ (*) begin
        case (state)
            IDLE : next_state = in ? IDLE : READ;
            READ : begin
                if ((cnt == 8) & (in)) 
                    next_state = DONE;
                else if ((cnt == 8) & (~in))
                    next_state = ERR;
                else begin
                    next_state = READ;
                    temp[cnt] = in;
                end
            end

            ERR  : next_state = in ? IDLE : ERR;
            DONE : begin
                next_state = in ? IDLE : READ;
                out_byte = temp;
            end
            
        endcase
    end

    assign done = (state == DONE); 
             
        
endmodule

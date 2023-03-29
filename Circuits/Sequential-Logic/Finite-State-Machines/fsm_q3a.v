module fsm_q3a (
    input   clk,
    input   reset,
    input   s,
    input   w,
    output  z
);

    parameter A = 0,
              B = 1;

    reg [1 : 0] state, next_state;

    reg [1 : 0] one_cnt;
    reg [1 : 0] clk_cnt;

    always@(posedge clk) begin
        if (reset)  state <= A;
        else        state <= next_state;
    end 

    always@(posedge clk) begin
        if (reset || state == A)    one_cnt <= 2'b0;
        else if (clk_cnt < 3)       one_cnt <= one_cnt + w;
        else                        one_cnt <= w ? 1 : 0;
    end
    
    always @(posedge clk) begin
        if (reset || state == A)    clk_cnt <= 2'd0;
        else if (clk_cnt < 3)       clk_cnt <= clk_cnt + 1;
        else                        clk_cnt <= 1;
    end

    always@(*) begin
        case(state) 
            A : next_state = s ? B : A;
            B : next_state = B;
        endcase
    end

    assign z = (one_cnt == 2) & (clk_cnt == 3);


endmodule
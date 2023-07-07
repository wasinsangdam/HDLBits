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

    reg [1 : 0] w_cnt;
    reg [1 : 0] clk_cnt;

    always@(posedge clk) begin
        if (reset)  state <= A;
        else        state <= next_state;
    end 

    // Count w signal
    always@(posedge clk) begin
        if      (reset || state == A)   w_cnt <= 2'd0;
        else if (clk_cnt < 3)           w_cnt <= w_cnt + w;
        else                            w_cnt <= w ? 1 : 0;
    end
    
    // Count clk signal (1 2 3 1 2 3 1 2 3 ...)
    always @(posedge clk) begin
        if      (reset || state == A)   clk_cnt <= 2'd0;
        else if (clk_cnt < 3)           clk_cnt <= clk_cnt + 'd1;
        else                            clk_cnt <= 1'd1;
    end

    always@(*) begin
        case(state) 
            A : next_state = s ? B : A;
            B : next_state = B;
        endcase
    end

    // z = 1, only when w_cnt = 2 and clk_cnt = 3  
    assign z = (w_cnt == 2) & (clk_cnt == 3);


endmodule
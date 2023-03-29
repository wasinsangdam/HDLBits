module mealy_q8 (
    input   clk,
    input   aresetn,
    input   x,
    output  z
);
    /* State Parameter */
    parameter ST1  = 2'd0,
              ST2  = 2'd1,
              ST3  = 2'd2;

    /* State Register */
    reg [1 : 0] state, next_state;

    /* Sequential Logic */
    always@(posedge clk, negedge aresetn) begin
        if (!aresetn)   state <= ST1;
        else            state <= next_state;
    end

    /* Combinational Logic */
    always@(*) begin
        case (state)
            ST1 : next_state = x ? ST2 : ST1;
            ST2 : next_state = x ? ST2 : ST3;
            ST3 : next_state = x ? ST2 : ST1;
            default : next_state = ST1;
        endcase
    end

    /* Assign Logic */
    assign z = (state == ST3) & x; // Output depends on current state and input -> Mealy Machine 
    
    /* Debug state*/
    reg [31 : 0] debug;
    
    always @(*) begin
        case (state)
            ST1  : debug = "ST1 ";
            ST2  : debug = "ST2 ";
            ST3  : debug = "ST3 ";
        endcase
    end

endmodule

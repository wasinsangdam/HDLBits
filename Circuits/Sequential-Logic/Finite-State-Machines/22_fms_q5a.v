module twos_comple_moore (
    input clk,
    input areset,
    input x,
    output z
);

    parameter Q0 = 0,
              Q1 = 1,
              Q2 = 2;

    reg [1 : 0] state, next_state;

    /* Sequential Logic */
    always@(posedge clk, posedge areset) begin
        if (areset) state <= Q0;
        else        state <= next_state;
    end

    /* Combinational Logic */
    always@(*) begin
        case(state) 
            Q0 : next_state = x ? Q1 : Q0;
            Q1 : next_state = x ? Q2 : Q1;
            Q2 : next_state = x ? Q2 : Q1;
            default : next_state = 2'bxx; 
        endcase
    end

    /* Assign Logic */
    assign z = (state == Q1);

    /* Debug state*/
    reg [31 : 0] debug;
    
    always @(*) begin
        case (state)
            Q0 : debug = " Q0 ";
            Q1 : debug = " Q1 ";
            Q2 : debug = " Q2 ";
        endcase
    end

    


endmodule
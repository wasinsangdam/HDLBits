module top_module (
    input                   clk     ,
    input                   resetn  ,
    input           [3 : 1] r       ,
    output          [3 : 1] g
);

    parameter   A = 0,
                B = 1,
                C = 2,
                D = 3;

    reg             [1 : 0] curr_state, next_state;

    always @ (posedge clk) begin
        if (!resetn)    curr_state <= A;
        else            curr_state <= next_state;
    end

    always @ (*) begin
        case (curr_state)
            A       :   next_state = r[1] ? B : r[2] ? C : r[3] ? D : A;
            B       :   next_state = r[1] ? B : A;
            C       :   next_state = r[2] ? C : A;
            D       :   next_state = r[3] ? D : A;
        endcase
    end

    assign g[1] = (curr_state == B);
    assign g[2] = (curr_state == C);
    assign g[3] = (curr_state == D);
    
endmodule